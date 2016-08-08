require_dependency 'helpdesk/application_controller'

module Helpdesk
  class TicketOcurrencesController < ApplicationController
    before_action :set_ticket
    before_action :set_ticket_ocurrence, only: [:destroy, :edit, :update]


    def index
      authorize :ticket_ocurrence,  :index?
      @ticket_ocurrences =  @ticket.ticket_ocurrences.all
    end

    def new
      authorize :ticket_ocurrence,  :create?
      @ticket_ocurrence = @ticket.ticket_ocurrences.new
    end

    def create
      authorize :ticket_ocurrence,  :create?
      @ticket_ocurrence = @ticket.ticket_ocurrences.new(set_params)
      @ticket_ocurrence.save

      @ticket_ocurrences = @ticket.ticket_ocurrences
    end

    def edit
      authorize :ticket_ocurrence,  :update?
    end

    def update
      authorize :ticket_ocurrence,  :update?
      if @ticket_ocurrence.update(set_params)
        flash[:success] = t :success
        redirect_to action: 'index'
      else
        render action: 'edit'
      end
    end

    def destroy
      authorize :ticket_ocurrence,  :destroy?
      if @ticket_ocurrence.destroy
        flash[:success] = t :success
        redirect_to action: 'index'
      end
    end

    private

    def set_params
      params.require(:ticket_ocurrence).permit(:ocurrence, :responsible_id)
    end

    def set_ticket
      @ticket = Ticket.unscoped.find(params[:ticket_id])
    end

    def set_ticket_ocurrence
      @ticket_ocurrence = TicketOcurrence.unscoped.find(params[:id])
    end

  end
end
