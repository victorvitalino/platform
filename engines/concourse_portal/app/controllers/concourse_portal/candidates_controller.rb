module ConcoursePortal
  class CandidatesController < ApplicationController
    before_action :set_project
    before_action :set_subscribe

    def new
      @candidate = Concourse::Candidate.new
    end

    def create

    end

    private

    def set_project
      @project = Concourse::Project.friendly.find(params[:project_id])
    end

    def set_subscribe
      @subscribe = Concourse::Subscribe.find(params[:subscribe_id])
    end

    def set_params
      params.require(:candidate).permit(:subscribe, :password)
    end
  end
end