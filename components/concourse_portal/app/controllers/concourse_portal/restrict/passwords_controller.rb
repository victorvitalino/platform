require_dependency 'concourse_portal/application_controller'
module ConcoursePortal
  module Restrict
    class PasswordsController < ApplicationController
      before_action :set_project
      before_action :set_candidate

      def edit
        @candidate = ConcoursePortal::Password.find(session[:candidate_id])
      end

      def update
        if @candidate.update(set_params)
          flash[:success] = t :success
          redirect_to project_restrict_candidates_path(@project)
        else
          render action: 'edit'
        end
      end

      private

      def set_candidate
        if session[:candidate_id].present?
          @candidate = ConcoursePortal::Password.find(session[:candidate_id]) rescue nil
        else
          redirect_to project_restrict_path(@project)
        end
      end

      def set_project
        @project = Concourse::Project.friendly.find(params[:project_id])
      end
      
      def set_params
        params.require(:password).permit(:password, :confirmation_password, :current_password)
      end
    end
  end
end