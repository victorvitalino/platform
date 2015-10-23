require_dependency 'helpdesk/application_controller'

module Helpdesk
  class TicketTypesController < ApplicationController
    before_action :set_ticket_type, only: [:destroy, :edit, :update]

    def index
      @ticket_types = TicketType.all
    end

    def new
      @ticket_type = TicketType.new
    end

    def create
      @ticket_type = TicketType.new(set_params)
      if @ticket_type.save
        flash[:success] = t :success
        redirect_to action: 'index'
      else
        render action: 'new'
      end
    end

    def edit
    end

    def update
      if @ticket_type.update(set_params)
        flash[:success] = t :success
        redirect_to action: 'index'
      else
        render action: 'edit'
      end
    end

    def destroy
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