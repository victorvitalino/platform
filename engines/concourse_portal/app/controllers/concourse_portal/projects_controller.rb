require_dependency 'concourse_portal/application_controller'
module ConcoursePortal
  class ProjectsController < ApplicationController
    
    def index
      @projects = Concourse::Project.all
    end
    
    def show
      @project  = Concourse::Project.friendly.find(params[:id])
    end
  end
end