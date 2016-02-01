require 'concourse_portal/application_controller'

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
        if @candidate.update(set_params)
          flash[:success] = t :success
          redirect_to action: :index
        else
          render action: :edit
        end
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