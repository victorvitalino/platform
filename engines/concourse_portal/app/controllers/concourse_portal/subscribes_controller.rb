require_dependency 'concourse_portal/application_controller'
module ConcoursePortal
  class SubscribesController < ApplicationController
   
    def index
      @subscribe  = ConcoursePortal::Subscribe.new
      @current_nav = 'new_subscribe'
    
    end

    def create
      
      @subscribe = ConcoursePortal::Subscribe.new(set_params)
      @current_nav = 'new_subscribe'
      
      if @subscribe.valid?
        session[:candidate_id] = @subscribe._id
        @candidate = Concourse::Candidate.find(session[:candidate_id])
        
        redirect_to project_subscribes_success_path(@candidate.subscribe.project.slug)

      else
        render action: 'index'
      end
    end

    def remember_subscribe
      @subscribes = Concourse::Candidate.where(cpf: params[:cpf], subscribe_id: [@project.subscribes.map(&:id)])
    end

    def remember_password
    end


    private

    def set_project
      @project = Concourse::Project.friendly.find(params[:project_id])
    end

    def set_params
      params.require(:subscribe).permit(:subscribe, :password)
    end

  end
end