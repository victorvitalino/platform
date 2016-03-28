require_dependency 'concourse_portal/application_controller'
module ConcoursePortal
  class ProjectsController < ApplicationController
    layout 'layouts/concourse_portal/application', except: [:index]

    def index
      @projects = Concourse::Project.all

      render layout: 'shared/portal'
    end
    
    def show
      @project = Concourse::Project.friendly.find(params[:id])
      @current_nav = "home"
    end

    def result
    end

    def all_projects
    end

  end
end