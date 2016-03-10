module Concourse
  class WinnersController < ApplicationController
    layout 'concourse/winner'
    
    include Authenticate::StaffService
    include Pundit
    
    helper  Authenticate::StaffHelper
    helper  Shared::NavHelper
    
    before_action :authenticate_staff?
    before_action :set_project


    def new
      @winner = Winner.new
    end

    def create
      @winner = Winner.new(set_params)
      @winner.project_id = @project.id
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