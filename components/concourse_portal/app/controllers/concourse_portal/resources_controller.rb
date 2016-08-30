require_dependency 'concourse_portal/application_controller'

module ConcoursePortal
  class ResourcesController < ApplicationController
    before_action :set_project

    def index
      @resources = @project.resources
    end

    def show
      @resource = @project.resources.find(params[:id])
    end

    def new
      @resource = @project.resources.new
    end

    def create
      @resource = @project.resources.new(set_params)

      if @resource.save 
        ConcoursePortal::SubscribeMailer.resource(@resource.candidate.email, @resource).deliver_now!
        flash[:success] = t :success
        redirect_to action: :index
      else
        render action: :new
      end
    end

    private

    def set_params
      params.require(:resource).permit(:message, :candidate_id, :password)
    end

    def set_project
      @project = Concourse::Project.friendly.find(params[:project_id])
    end
  end
end