require_dependency 'helpdesk/application_controller'

module Helpdesk
  class TicketSubjectsController < ApplicationController
    before_action :set_ticket_type, except: [:index_json]
    before_action :set_ticket_subject, only: [:destroy, :edit, :update]

    def index_json
      render json: TicketSubject.where(ticket_type_id: params[:ticket_type_id]).order(:title).map(&:title)
    end

    def index
      authorize :ticket_subject,  :index?
      @ticket_subjects = @ticket_type.ticket_subjects.order(:title)
    end

    def new
      authorize :ticket_subject,  :create?
      @ticket_subject = @ticket_type.ticket_subjects.new
    end

    def create
      authorize :ticket_subject,  :create?
      @ticket_subject = @ticket_type.ticket_subjects.new(set_params)
      if @ticket_subject.save
        flash[:success] = t :success
        redirect_to action: 'index'
      else
        render action: 'new'
      end
    end

    def edit
      authorize :ticket_subject,  :update?
    end

    def update
      authorize :ticket_subject,  :update?
      if @ticket_subject.update(set_params)
        flash[:success] = t :success
        redirect_to action: 'index'
      else
        render action: 'edit'
      end
    end

    def destroy
      authorize :ticket_subject,  :destroy?
      if @ticket_subject.destroy
        flash[:success] = t :success
        redirect_to action: 'index'
      end
    end

    private

    def set_params
      params.require(:ticket_subject).permit(:title, :description, :status)
    end

    def set_ticket_type
      @ticket_type = TicketType.unscoped.find(params[:ticket_type_id])
    end

    def set_ticket_subject
      @ticket_subject = TicketSubject.unscoped.find(params[:id])
    end

  end
end
