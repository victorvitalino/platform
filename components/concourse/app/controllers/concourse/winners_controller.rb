require_dependency 'concourse/application_controller'

module Concourse
  class WinnersController < ApplicationController
    layout 'concourse/winner'
    
    before_action :set_project

    def new
      @winner = @project.winners.new
    end

    def create
      @winner = @project.winners.new(set_params)
      @winner.save
    end

    def show
      @winner = @project.winners.find_by_participation_id(params[:id])
    end

    private

    def set_params
      params.require(:winner).permit(:winner_type, :participation_id)
    end

    def set_project
      @project = Project.friendly.find(params[:project_id])
    end
  end
end