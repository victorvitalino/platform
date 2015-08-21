require_dependency 'concourse_portal/application_controller'

module ConcoursePortal
  class ConsultsController < ApplicationController
    before_action :set_project
    layout 'layouts/concourse_portal/application'

    def new
      @consult = @project.consults.new
    end

    def create
    
      @consult = @project.consults.new(set_params)

      if @consult.save
        redirect_to project_consult_path(project_id: @project, id: @consult)
      else
        render action: 'new'
      end
    end

    def show
    end

    private

    def set_params
      params.require(:consult).permit(:content, :terms_use)
    end

    def set_project
      @project = Concourse::Project.friendly.find(params[:project_id])
    end
  end
end