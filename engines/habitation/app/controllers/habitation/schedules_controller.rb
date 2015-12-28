require_dependency 'habitation/application_controller'

module Habitation
  class SchedulesController < ApplicationController 
    before_action :set_agenda
    before_action :set_schedule, only: [:show, :edit, :update]
    
    has_scope :by_status
    has_scope :by_date
    
    def index
      authorize :schedule, :index?
      @schedules = apply_scopes(@agenda.agenda_schedules).all
    end

    def show
      authorize :schedule, :show?
    end

    def edit
      authorize :schedule, :update?
    end
    
    def update 
      authorize :schedule, :update?
      if @schedule.update(set_params)
        flash[:success] = t :success
        redirect_to agenda_schedules_path(@agenda)
      else
        render action: 'edit'
      @agenda = Schedule::Agenda.find(params[:agenda_id])
      end
    end

    def cancel
      authorize :schedule, :update?
      @schedule = Schedule::AgendaSchedule.find(params[:schedule_id])
      
      if @schedule.update(status: 1, observation: "agendamento liberado. atendente #matricula #{current_user.account.code}")
        flash[:success] = t :success
      else
        flash[:danger] =  t :danger
      end

      redirect_to agenda_schedules_path(@agenda)
    end

    private


    def set_params
      params.require(:agenda_schedule).permit(:status, :observation)
    end

    def set_agenda
      @agenda = Schedule::Agenda.find(params[:agenda_id])    
    end

    def set_schedule
      @schedule = @agenda.agenda_schedules.find(params[:id])
    end
  end
end    