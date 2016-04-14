module Concourse
  class WinnersController < ApplicationController
    
    
    include Authenticate::StaffService
    include Pundit
    
    helper  Authenticate::StaffHelper
    helper  ::NavigationHelper
    
    before_action :authenticate_staff?
    before_action :set_project

    def index
      authorize :winner, :index?

      @winners = @project.winners
    end
    

    def new
      authorize :winner, :create?

      @winner = Winner.new

      render layout: 'concourse/winner'
    end

    def create
      authorize :winner, :create?

      @winner = Winner.new(set_params)
      @winner.project_id = @project.id
      @winner.save

      render layout: 'concourse/winner'
    end

    def show
      authorize :winner, :create?

      @winner = @project.winners.find_by_participation_id(params[:id])
    
      render layout: 'concourse/winner'
    end

    def result
      authorize :winner, :create?
      
      render layout: 'concourse/winner'
    end


    def destroy

      authorize :winner, :destroy?

      @winner = @project.winners.find(params[:id])
      if @winner.destroy
        flash[:success] = "Vencedor cancelado com sucesso!"
      else
        flash[:danger] = "Vencedor cancelado com sucesso!"
      end
      
      redirect_to action: :index
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