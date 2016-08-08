require_dependency 'helpdesk/application_controller'

module Helpdesk
  class TicketSolutionsController < ApplicationController
    before_action :set_ticket_type, except: [:index_json]
    before_action :set_ticket_solution, only: [:destroy, :edit, :update]

    def index_solution_json
      render json: TicketSolution.where(ticket_type_id: params[:ticket_type_id]).order(:title).map(&:title)
    end

    def index
      authorize :ticket_solution,  :index?
      @ticket_solutions = @ticket_type.ticket_solutions.order(:title)
    end

    def new
      authorize :ticket_solution,  :create?
      @ticket_solution = @ticket_type.ticket_solutions.new
    end

    def create
      authorize :ticket_solution,  :create?
      @ticket_solution = @ticket_type.ticket_solutions.new(set_params)
      if @ticket_solution.save
        flash[:success] = t :success
        redirect_to action: 'index'
      else
        render action: 'new'
      end
    end

    def edit
      authorize :ticket_solution,  :udpate?
    end

    def update
      authorize :ticket_solution,  :udpate?
      if @ticket_solution.update(set_params)
        flash[:success] = t :success
        redirect_to action: 'index'
      else
        render action: 'edit'
      end
    end

    def destroy
      authorize :ticket_solution,  :destroy?
      if @ticket_solution.destroy
        flash[:success] = t :success
        redirect_to action: 'index'
      end
    end

    private

    def set_params
      params.require(:ticket_solution).permit(:title, :description, :status)
    end

    def set_ticket_type
      @ticket_type = TicketType.unscoped.find(params[:ticket_type_id])
    end

    def set_ticket_ticket_solution
      @ticket_solution = TicketSolution.unscoped.find(params[:id])
    end

  end
end
