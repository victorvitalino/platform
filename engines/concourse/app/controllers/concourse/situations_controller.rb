require_dependency 'concourse/application_controller'

module Concourse
  class SituationsController < ApplicationController
    before_action :set_candidate

    def edit
    end

    def update
      @candidate.status = params[:candidate][:status]
      @candidate.save!
    end

    private

    def set_params
      params.require(:candidate).permit(:status,:id)
    end

    def set_candidate
      @candidate = Candidate.find(params[:candidate_id])
      @project   = Project.friendly.find(params[:project_id])
    end
  end
end