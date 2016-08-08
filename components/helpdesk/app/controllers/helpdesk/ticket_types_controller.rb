require_dependency 'helpdesk/application_controller'

module Helpdesk
  class TicketTypesController < ApplicationController
    before_action :set_ticket_type, only: [:destroy, :edit, :update]

    def index
      authorize :ticket_type,  :index?
      @ticket_types = TicketType.all
    end

    def new
      authorize :ticket_type,  :create?
      @ticket_type = TicketType.new
    end

    def create
      authorize :ticket_type,  :create?
      @ticket_type = TicketType.new(set_params)
      if @ticket_type.save
        flash[:success] = t :success
        redirect_to action: 'index'
      else
        render action: 'new'
      end
    end

    def edit
      authorize :ticket_type,  :update?
    end

    def update
      authorize :ticket_type,  :update?
      if @ticket_type.update(set_params)
        flash[:success] = t :success
        redirect_to action: 'index'
      else
        render action: 'edit'
      end
    end

    def destroy
      authorize :ticket_type,  :destroy?
      if @ticket_type.destroy
        flash[:success] = t :success
        redirect_to action: 'index'
      end
    end

    private

    def set_params
      params.require(:ticket_type).permit(:sector_id, :title, :description, :status)
    end

    def set_ticket_type
      @ticket_type = TicketType.unscoped.find(params[:id])
    end

  end
end
