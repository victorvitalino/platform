module Concourse
  class Portal::ConsultationsController < ApplicationController
    layout 'layouts/concourse/project'

    before_action :set_project

    def index
    end
    
    def new
    end

    def create
    end
    
    private

    def set_project
      @project = Project.find(params[:project_id])
    end
  end
end