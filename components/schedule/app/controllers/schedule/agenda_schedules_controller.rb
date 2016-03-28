require_dependency 'schedule/application_controller'

module Schedule
  class AgendaSchedulesController < ApplicationController
    
    before_action :set_agenda  
    before_action :set_schedule, only: [:show, :update]  
    
    has_scope :by_date
    has_scope :by_status
    has_scope :by_cpf
    has_scope :by_hour
    
    def index
      authorize :agenda_schedule, :index?
      @schedules = apply_scopes(@agenda.agenda_schedules)
    end

    def show
      authorize :agenda_schedule, :index?
      @schedule = @agenda.agenda_schedules.find(params[:id])
    end

    def edit
      authorize :agenda_schedule, :edit?
    end

    def update
      authorize :agenda_schedule, :edit?
      if @schedule.update(set_params)
        flash[:success] = t :success
        redirect_to action: :show
      else
        render action: :show
      end
    end

    private

    def set_agenda
      @agenda = Schedule::Agenda.find(params[:agenda_id])
    end

    def set_schedule
      @schedule = @agenda.agenda_schedules.find(params[:id])
    end

    def set_params
      params.require(:agenda_schedule).permit(:status, :observation)
    end

  end
end