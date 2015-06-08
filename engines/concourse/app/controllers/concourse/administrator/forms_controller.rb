module Concourse
  class Administrator::FormsController < ApplicationController
     layout 'layouts/material'
    def index
      @module = 'forms'
      @project = Project.find(params[:project_id])
      @field = @project.candidate_fields.new
    end
  end
end