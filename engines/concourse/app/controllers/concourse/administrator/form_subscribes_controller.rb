module Concourse
  class Administrator::FormSubscribesController < ApplicationController
    layout 'layouts/material'
    before_action :set_project    
    
    def index
    end

    private

    def set_project
      @project = Project.find(params[:project_id])
    end
  end
end