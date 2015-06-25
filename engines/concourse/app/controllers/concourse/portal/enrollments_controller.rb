module Concourse
  class Portal::EnrollmentsController < ApplicationController
    layout 'layouts/concourse/project'
    before_action :set_project

    def index
      @enrollments = @project.enrollments
    end

    def new
    end

    private

    def set_project
      @project = Project.find(params[:project_id])
    end

    
  end
end