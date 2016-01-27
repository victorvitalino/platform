require_dependency 'concourse_portal/application_controller'
require 'barby'
require 'barby/barcode/code_128'
require 'barby/outputter/png_outputter'


module ConcoursePortal
  class CandidatesController < ApplicationController
    before_action :set_candidate, only: [:success, :bank_slip]

    def new
      if params[:subscribe_id].present?
        session[:subscribe_id] = params[:subscribe_id]
        @subscribe = ConcoursePortal::Subscribe.find(session[:subscribe_id])
        @current_nav = 'new_subscribe'
        @candidate = @subscribe.candidates.new
      else
        redirect_to @project
      end
    end

    def create
      @subscribe = ConcoursePortal::Subscribe.find(session[:subscribe_id])
      @candidate = @subscribe.candidates.new(set_params)
      
      if @candidate.valid?
        @candidate.subscribe.fields.each do |field|
          if field.file?
            @uploader = Concourse::FileUploader.new
            @uploader.store!(params[:candidate][:properties][field.label.to_sym])
            @candidate.properties[field.label.to_sym] = @uploader.path
          end
        end
      
        if @candidate.save
          ConcoursePortal::SubscribeMailer.success(@candidate,@project).deliver_now!
          session[:candidate_id] = @candidate.id
          session[:project_id] = @project.id
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
      @candidate = ConcoursePortal::Candidate.find(session[:candidate_id])
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

      @category = Brb::Category.find(@candidate.subscribe.type_guide_id)

      @invoice = Brb::Invoice.new({
        name: @candidate.name,
        cpf: @candidate.cpf, 
        cep: @candidate.cep,
        address: @candidate.address,
        state_id: @candidate.state_id,
        city: @candidate.city,
        due: (@candidate.subscribe.end + 1.days).strftime('%d/%m/%Y'),
        category_id: @category.id,
        message: "Concursos Codhab"
      })

      if @invoice.save!
        barcode = Barby::Code128.new(@invoice.barcode)
        File.open("public/barcodes/#{barcode}.png", 'w') { |f| f.write barcode.to_png(xdim: 1,height: 50) }
    
        render layout: 'brb/invoice'
      else
        redirect_to action: :show
      end
    end
    
    private

    def set_project
      @project = Concourse::Project.friendly.find(params[:project_id])
    end

    def set_candidate
      if session[:candidate_id].present?
        @candidate = ConcoursePortal::Candidate.find(session[:candidate_id])
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