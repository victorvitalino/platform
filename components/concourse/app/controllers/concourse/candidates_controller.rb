require_dependency 'concourse/application_controller'

module Concourse
  class CandidatesController < ApplicationController
    before_action :set_project, except: [:view_all]

    def view_all
      @candidates = Concourse::Candidate.all
      render layout: 'shared/remark'
    end

    def index
    end

    def show
      @candidate = @project.candidates.find(params[:id]) 
    end

    private

    def set_project
      @project = Project.friendly.find(params[:project_id])
    end

  end
end