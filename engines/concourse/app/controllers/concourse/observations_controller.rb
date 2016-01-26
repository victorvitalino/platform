require_dependency 'concourse/application_controller'

module Concourse
  class ObservationsController < ApplicationController
    before_action :set_candidate

    def new
      @observation = @candidate.observations.new
    end

    def create
      @observation = @candidate.observations.new(set_params)
      @observation.staff_id = current_user.account_id
      @observation.save
    end

    private

    def set_params
      params.require(:observation).permit(:content, :message_type)
    end

    def set_candidate
      @project   = Project.friendly.find(params[:project_id])
      @candidate = Candidate.find(params[:candidate_id])
    end

  end
end