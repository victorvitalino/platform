require_dependency 'helpdesk/application_controller'

module Helpdesk
  class TicketAttendantsController < ApplicationController
    before_action :set_ticket_type
    before_action :set_ticket_attendant, only: [:destroy, :edit, :update]

    def index
      authorize :ticket_attendant,  :index?
      @ticket_attendants = @ticket_type.ticket_attendants
    end

    def new
      authorize :ticket_attendant,  :create?
      @ticket_attendant = @ticket_type.ticket_attendants.new
    end

    def create
      authorize :ticket_attendant,  :create?
      @ticket_attendant = @ticket_type.ticket_attendants.new(set_params)
      if @ticket_attendant.save
        flash[:success] = t :success
        redirect_to action: 'index'
      else
        render action: 'new'
      end
    end

    def edit
      authorize :ticket_attendant,  :update?
    end

    def update
      authorize :ticket_attendant,  :update?
      if @ticket_attendant.update(set_params)
        flash[:success] = t :success
        redirect_to action: 'index'
      else
        render action: 'edit'
      end
    end

    def destroy
      authorize :ticket_attendant,  :destroy?
      if @ticket_attendant.destroy
        flash[:success] = t :success
        redirect_to action: 'index'
      end
    end

    private

    def set_params
      params.require(:ticket_attendant).permit(:staff_id, :status)
    end

    def set_ticket_type
      @ticket_type = TicketType.unscoped.find(params[:ticket_type_id])
    end

    def set_ticket_attendant
      @ticket_attendant = TicketAttendant.unscoped.find(params[:id])
    end

  end
end
