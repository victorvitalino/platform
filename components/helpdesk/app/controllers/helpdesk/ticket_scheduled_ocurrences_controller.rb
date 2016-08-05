require_dependency 'helpdesk/application_controller'

module Helpdesk
  class TicketScheduledOcurrencesController < ApplicationController
    before_action :set_ticket

    def new
      authorize :ticket_solution,  :scheduled?
      @ticket_scheduled_ocurrence = @ticket.ticket_ocurrences.new
    end

    def create
      authorize :ticket_solution,  :scheduled?
      @ticket_scheduled_ocurrence = @ticket.ticket_ocurrences.new(set_params)
      @ticket_scheduled_ocurrence.staff_id = current_user.id
      @ticket_scheduled_ocurrence.scheduled = true
      @ticket_scheduled_ocurrence.save
      @ticket.update(status: 3)

    end

    private

    def set_params
      params.require(:ticket_ocurrence).permit(:ocurrence, :scheduled_date)
    end

    def set_ticket
      @ticket = Ticket.unscoped.find(params[:ticket_id])
    end

  end
end
