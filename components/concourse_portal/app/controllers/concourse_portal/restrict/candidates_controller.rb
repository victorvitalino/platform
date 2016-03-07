require 'concourse_portal/application_controller'
require 'barby'
require 'barby/barcode/code_128'
require 'barby/outputter/png_outputter'

module ConcoursePortal
  module Restrict
    class CandidatesController < ApplicationController
      before_action :set_project
      before_action :set_candidate

      def index
      end

      def edit
      end

      def update
     
        if @candidate.update_attributes!(set_params)
          if params[:candidate].include?('properties')
            @candidate.subscribe.fields.each do |field|
              if field.file? 
                @uploader = Concourse::FileUploader.new
                @uploader.store!(params[:candidate][:properties][field.label.to_sym])
                @candidate.properties[field.label.to_sym] = @uploader.filename
              end
            end
          end
          
          if @candidate.save!
            ConcoursePortal::SubscribeMailer.update(@candidate,@project).deliver_now!
            flash[:success] = t :success
          end
          
          redirect_to action: :index
         
        else
          render action: :edit
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
          due: @candidate.subscribe.date_payment.strftime('%d/%m/%Y'),
          category_id: @category.id,
          message: "Concursos Codhab"
        })

        if @invoice.save
          barcode = Barby::Code128.new(@invoice.barcode)
          File.open("public/barcodes/#{barcode}.png", 'w') { |f| f.write barcode.to_png(xdim: 1,height: 50) }
      
          render layout: 'brb/invoice'
        else
          flash[:danger] = "Não é possível realizar a emissão de boleto fora do período especificado no edital"
          redirect_to action: :index
        end
      end

      def logout
        session[:candidate_id] = nil
        redirect_to project_restrict_path(@project)
      end

      private

      def set_params

      dinamic_fields = @candidate.subscribe.fields.map { |field| field.label.to_sym } 

      params.require(:candidate).permit(:name, :rg, :born, 
              :state_id, :city, :cep, :address, :burgh, :telephone,
              :celphone, :email, :gender, :fantasy_name, :social_reason, 
              :cnpj, :properties => dinamic_fields)
      end

      def set_project
        @project = Concourse::Project.friendly.find(params[:project_id])
      end

      def set_candidate
        if session[:candidate_id].present?
          @candidate = ConcoursePortal::Candidate.find(session[:candidate_id]) rescue nil
        else
          redirect_to project_restrict_path(@project)
        end
      end
    end
  end
end