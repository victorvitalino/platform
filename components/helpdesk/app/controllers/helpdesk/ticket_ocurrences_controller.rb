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

    def transfer_responsible
      @ticket_ocurrence = @ticket.ticket_ocurrences.new
    end

    def transfer_responsible_ticket
      @ticket_ocurrence = @ticket.ticket_ocurrences.new
      @ticket_ocurrence.ocurrence = "Transferência de resposabilidade. #{params[:ticket_ocurrence][:ocurrence]}"
      @ticket_ocurrence.staff_id = current_user.id
      @ticket_ocurrence.responsible_id = params[:ticket_ocurrence][:responsible_id]
      @ticket_ocurrence.save
      @ticket.update(attendant_id: params[:ticket_ocurrence][:responsible_id])

      @open         = Helpdesk::Ticket.open
      @in_progress  = Helpdesk::Ticket.in_progress
      @closed       = Helpdesk::Ticket.closed
      @scheduled    = Helpdesk::Ticket.scheduled
    end


    def update
      authorize :ticket_ocurrence,  :update?
      @ticket_ocurrence.update(set_params)
      @ticket_ocurrences = @ticket.ticket_ocurrences
    end

    def destroy
      authorize :ticket_ocurrence,  :destroy?
      if @ticket_ocurrence.destroy
        flash[:success] = t :success
        redirect_to action: 'index'
      end
    end

    def closed_ticket
       @ticket_ocurrence = Helpdesk::TicketOcurrence.new
    end

    def closed
      #authorize :ticket,  :closed?
      @ticket.update(status: 2, attendant_id: current_user.id, attendance_end: Time.now)

      @ticket_ocurrence = @ticket.ticket_ocurrences.new(set_params)
      @ticket_ocurrence.staff_id = current_user.id
      @ticket_ocurrence.ocurrence = 'Chamado encerrado'
      @ticket_ocurrence.responsible_id =  current_user.id
      @ticket_ocurrence.ticket_solution_title = params[:ticket_ocurrence][:ticket_solution_title]
      @ticket_ocurrence.solution_date = Time.now
      @ticket_ocurrence.save

      @open         = Helpdesk::Ticket.open
      @in_progress  = Helpdesk::Ticket.in_progress
      @closed       = Helpdesk::Ticket.closed
      @scheduled    = Helpdesk::Ticket.scheduled


    end





    private

    def set_params
      params.require(:ticket_ocurrence).permit(:ocurrence,:ticket_id, :responsible_id,:ticket_solution_title, :solution_date)
    end

    def set_ticket
      @ticket = Ticket.unscoped.find(params[:ticket_id])
    end

    def set_ticket_ocurrence
      @ticket_ocurrence = TicketOcurrence.unscoped.find(params[:id])
    end

  end
end
