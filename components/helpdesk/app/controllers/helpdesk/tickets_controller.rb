require_dependency 'helpdesk/application_controller'

module Helpdesk
  class TicketsController < ApplicationController
    before_action :set_ticket, only: [:show, :show_requester, :destroy, :edit, :update]
    before_action :set_ticket_ocurrence, only: [:show,:show_requester]

    def index
      authorize :ticket,  :index?
      @open         = Helpdesk::Ticket.open
      @in_progress  = Helpdesk::Ticket.in_progress
      @closed       = Helpdesk::Ticket.closed
      @scheduled    = Helpdesk::Ticket.scheduled
    end

    def new
      authorize :ticket,  :create?
      @ticket = Helpdesk::Ticket.new
    end

    def show
      authorize :ticket,  :index?
    end

    def show_requester

    end

    def create
        authorize :ticket,  :create?
      @ticket = Helpdesk::Ticket.new({
        ticket_type_id: params[:ticket][:ticket_type_id],
        ticket_subject_title: params[:ticket][:ticket_subject_title],
        description: params[:ticket][:description],
        requester_id: current_user.id
      })

      @ticket.save
    end

    def requester
      @tickets = Helpdesk::Ticket.where(requester_id: current_user.id).order('created_at DESC')
    end

    def open
      authorize :ticket,  :to_attendant?
      @ticket = Helpdesk::Ticket.find(params[:ticket_id])
      if @ticket.update(status: 0, attendant_id: current_user.id, attendance_start: Time.now)
        TicketOcurrence.create_ocurrence(@ticket.id, current_user.id,"reabertura de chamado.")
        flash[:success] = t :success
        redirect_to action: 'index', q: params[:q]
      else
        flash[:danger] = t :danger
        redirect_to action: 'index', q: params[:q]
      end
    end

    def in_progress
      authorize :ticket,  :to_attendant?
      @ticket = Helpdesk::Ticket.find(params[:ticket_id])
      if @ticket.update(status: 1, attendant_id: current_user.id, attendance_start: Time.now)
        flash[:success] = t :success
        redirect_to action: 'index', q: params[:q]
      else
        flash[:danger] = t :danger
        redirect_to action: 'index', q: params[:q]
      end
    end



    def closed
      authorize :ticket,  :closed?
      @ticket = Helpdesk::Ticket.find(params[:ticket_id])
      if @ticket.update(status: 2, attendant_id: current_user.id, attendance_end: Time.now)
        flash[:success] = t :success
        redirect_to action: 'index', q: params[:q]
      else
        flash[:danger] = t :danger
        redirect_to action: 'index', q: params[:q]
      end
    end

    def edit
    end

    def update
      if @ticket_subject.update(set_params)
        flash[:success] = t :success
        redirect_to action: 'index'
      else
        render action: 'edit'
      end
    end

    def destroy
      if @ticket_subject.destroy
        flash[:success] = t :success
        redirect_to action: 'index'
      end
    end

    private

    def set_params
      params.require(:ticket).permit(:ticket_subject_title, :ticket_type_id)
    end

    def set_ticket
      params[:id] = params[:id].present? ? params[:id] : params[:ticket_id]
      @ticket = Ticket.find(params[:id])
    end

    def set_ticket_subject
      @ticket_subject = TicketSubject.unscoped.find(params[:id])
    end

    def set_ticket_ocurrence
      @ticket_ocurrences =  @ticket.ticket_ocurrences.all
    end

  end
end
