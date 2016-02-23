require_dependency 'schedule/application_controller'

module Schedule
  class AgendasController < ApplicationController
    before_action :set_agenda, only: [:show, :update, :edit]

    has_scope :by_date
    has_scope :by_status
    has_scope :by_cpf
    has_scope :by_hour
    
    def info
      if params[:agenda_id].present?
        @agenda = Agenda.find(params[:agenda_id])
        render json: [@agenda, Date.today.stftime('%d/%m/%Y')]
      else
        render json: 'not found'
      end
    end

    def index
      authorize :agenda, :index?
      @agendas = Agenda.all
    end
    
    def new
      authorize :agenda, :new?
      @agenda = Agenda.new
    end

    def create
      authorize :agenda, :new?
      @agenda = Agenda.new(set_params)

      if @agenda.save
        flash[:success] = t :success
        redirect_to action: 'index'
      else
        render action: 'new'
      end
    end

    def update
      authorize :agenda, :edit?
      if @agenda.update(set_params)
        flash[:success] = t :success
        redirect_to action: 'index'
      else
        render action: 'edit'
      end
    end

    def destroy
      authorize :agenda, :destroy?
    end

    private
    
    def set_params
      params.require(:agenda).permit(:title, :description, :avatar, :start, :end, :disable_dates,
                                     :start_hour, :end_hour, :attendance_time, :attendants, :weekend,
                                     :lunch_time, :lunch_attendants, :lunch_start, :lunch_end, :restriction_type,
                                     :restriction_sql, :program_id, :status)
    end

    def set_agenda
      @agenda = Agenda.find(params[:id])
    end

  end
end 