module ConcoursePortal
  class PasswordsController < ApplicationController
    before_action :set_session

    def edit
      @candidate = Concourse::Candidate.find(session[:candidate_id])
    end

    def update
      @candidate = Concourse::Candidate.find(session[:candidate_id])
      if @candidate.update(set_params)
        flash[:success] = t :success
        redirect_to project_subscribes_success_path(@project)
      else
        render action: 'edit'
      end
    end

    private

    def set_session
      @project = Concourse::Project.friendly.find(params[:project_id])
      unless session[:candidate_id].present?
        redirect_to project_path(@project)
      end
    end

    def set_params
      params.require(:candidate).permit(:password, :confirmation_password, :current_password)
    end
  end
end