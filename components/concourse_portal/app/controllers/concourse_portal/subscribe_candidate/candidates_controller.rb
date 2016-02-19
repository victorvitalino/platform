require_dependency 'concourse_portal/application_controller'

module ConcoursePortal
  module SubscribeCandidate
    class CandidatesController < ApplicationController
      before_action :set_project
      before_action :set_subscribe, except: [:index]

      def index
        session[:subscribe_id] = nil
      end
    
      def new
        @candidate = @subscribe.candidates.new
      end

      def create
        @candidate = @subscribe.candidates.new(set_params)
        
        if @candidate.valid?
          @candidate.subscribe.fields.each do |field|
            if field.file?
              @uploader = Concourse::FileUploader.new
              @uploader.store!(params[:candidate][:properties][field.label.to_sym])
              @candidate.properties[field.label.to_sym] = @uploader.filename
            end
          end

          if @candidate.save!
            session[:candidate_id] = @candidate.id
            ConcoursePortal::SubscribeMailer.success(@candidate,@project).deliver_now!
            flash[:success] =  t :success
            redirect_to project_restrict_candidates_path(@project)
          else 
            render action: :new
          end
        else
          render action: :new
        end
      end

      private

      def set_params
        dinamic_fields = @subscribe.fields.map { |field| field.label.to_sym } 

        params.require(:candidate).permit(:name, :rg, :cpf, :born, 
              :state_id, :city, :cep, :address, :burgh, :telephone,
              :celphone, :email, :gender, :fantasy_name, :social_reason, 
              :password, :confirmation_password, :terms_use,
              :cnpj, :properties => dinamic_fields)
      end

      def set_project
        @project = Concourse::Project.friendly.find(params[:project_id])
      end  

      def set_subscribe

        session[:subscribe_id] = params[:subscribe_id] unless session[:subscribe_id].present?

        @subscribe = ConcoursePortal::Subscribe.find(session[:subscribe_id]) rescue nil

        redirect_to action: :index if @subscribe.nil?
      end
    end
  end
end