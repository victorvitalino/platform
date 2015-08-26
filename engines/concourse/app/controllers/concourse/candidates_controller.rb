module Concourse
  class CandidatesController < ApplicationController
    before_action :set_project

    def show
      @candidate = @project.candidates.find(params[:id]) 
    end

    private

    def set_project
      @project = Project.friendly.find(params[:project_id])
    end

  end
end