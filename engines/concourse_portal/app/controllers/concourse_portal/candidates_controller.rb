require_dependency 'concourse_portal/application_controller'
require 'barby'
require 'barby/barcode/code_128'
require 'barby/outputter/png_outputter'
require 'codhab_billing'

module ConcoursePortal
  class CandidatesController < ApplicationController
    before_action :set_project
    before_action :set_candidate, only: [:success, :bank_slip]
    def new
      if params[:subscribe_id].present?
        session[:subscribe_id] = params[:subscribe_id]
        @subscribe = Concourse::Subscribe.find(session[:subscribe_id])
        @current_nav = 'new_subscribe'
        @candidate = @subscribe.candidates.new
      else
        redirect_to @project
      end
    end

    def create
      @subscribe = Concourse::Subscribe.find(session[:subscribe_id])
      @candidate = @subscribe.candidates.new(set_params)
      
      if @candidate.valid?
        @candidate.subscribe.fields.each do |field|
          if field.file?
            byebug
            @uploader = Concourse::FileUploader.new
            @uploader.store!(params[:candidate][:properties][field.label.to_sym])
            @candidate.properties[field.label.to_sym] = @uploader.path
          end
        end
      
        if @candidate.save
          session[:candidate_id] = @candidate.id
          redirect_to project_subscribes_success_path(@project)
        else 
          render action: 'new'
        end
      else
        @nav = 'new_subscribe'
        render action: 'new'
      end
    end

    def show
      @candidate = Concourse::Candidate.find(session[:candidate_id])
    end

    def success
    end

    def logout
      if session[:candidate_id].present?
        session[:candidate_id] = nil
        redirect_to action: 'new'
      end
    end

    def bank_slip

        @guide    = Finance::TypeGuide.find(@candidate.subscribe.type_guide_id)


        @payment_guide  = Finance::PaymentGuide.new(
            type_guide_id: @guide.id,
            deadline: @candidate.subscribe.end - 5.days,
            name: @candidate.name,
            cpf: @candidate.cpf,
            value: @guide.value,
            observation: "#{@candidate.id} - #{@candidate.subscribe.project.title}",
            model_guide: 1
        )

        if @payment_guide.save
          @value = '%.2f' % @payment_guide.value

          @barcode = CodhabBilling::Bills::BankSlip.new(
              {
                value: @value.to_s.gsub('.',''),
                deadline: @payment_guide.deadline,
                sequential: @payment_guide.id
              }
          )

          @payment_guide.update(barcode: @barcode.barcode_without_format)
        end

        barcode = Barby::Code128.new(@barcode.barcode_without_format)
        @bar_code = "#{@payment_guide.created_at.strftime('%Y%m%d')}_barcode_#{@payment_guide.cpf}#{@payment_guide.id}"
        File.open("public/barcodes/#{@bar_code}.png", 'w'){|f| f.write barcode.to_png(xdim: 1,height: 50) }
        
        render layout: 'layouts/finance/show_payment', template: 'layouts/finance/templates/bankslip'
    end
    
    private

    def set_project
      @project = Concourse::Project.friendly.find(params[:project_id])
    end

    def set_candidate
      if session[:candidate_id].present?
        @candidate = Concourse::Candidate.find(session[:candidate_id])
      else
        redirect_to action: 'new'
      end
    end

    def set_subscribe
      if session[:subscribe_id].present?
        @subscribe = Concourse::Subscribe.find(session[:subscribe_id])
      else
        redirect_to project_path(@project)
      end
    end
    def set_params

      dinamic_fields = @subscribe.fields.map { |field| field.label.to_sym } 

      params.require(:candidate).permit(:name, :cpf, :rg, :born, :password, :confirmation_password, 
              :state_id, :city, :cep, :address, :burgh, :telephone,
              :celphone, :email, :gender, :fantasy_name, :social_reason, 
              :cnpj, :terms_use, :properties => dinamic_fields)
    end
  end
end