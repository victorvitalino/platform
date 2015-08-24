require_dependency 'concourse_portal/application_controller'

module ConcoursePortal
  class CandidatesController < ApplicationController
    before_action :set_project

    def new
      if params[:subscribe_id].present?
        session[:subscribe_id] = params[:subscribe_id]
        @current_nav = 'new_subscribe'
        @candidate = Concourse::Candidate.new
      else
        redirect_to @project
      end
    end

    def create
      @candidate = Concourse::Candidate.new(set_params)
      @candidate.subscribe_id = session[:subscribe_id]
      
      if @candidate.save
        session[:candidate_id] = @candidate.id
        redirect_to project_subscribes_success_path(@project)
      else
        @nav = 'new_subscribe'
        render action: 'new'
      end
    end

    def show
      @candidate = Concourse::Candidate.find(session[:candidate_id])
    end

    def success
      if session[:candidate_id].present?
        @candidate = Concourse::Candidate.find(session[:candidate_id])
      else
        redirect_to action: 'new'
      end
    end

    def logout
      if session[:candidate_id].present?
        session[:candidate_id] = nil
        redirect_to action: 'new'
      end
    end


    private

    def set_project
      @project = Concourse::Project.friendly.find(params[:project_id])
    end


    def set_params
      params.require(:candidate).permit(:name, :cpf, :rg, :born, :password, :confirmation_password, :state_id, :city, :cep, :address, :burgh, :telephone,
                                        :celphone, :email, :gender, :fantasy_name, :social_reason, :cnpj, :terms_use, :password)
    end
  end
end