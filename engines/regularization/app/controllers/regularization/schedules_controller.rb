require_dependency 'regularization/application_controller'

module Regularization
  class SchedulesController < ApplicationController 
    before_action :set_agenda
    before_action :set_schedule, only: [:edit, :show, :update]

    has_scope :by_status
    has_scope :by_date

    def index
      @schedules = apply_scopes(@agenda.agenda_schedules).all
    end
    
    def show
    end
    
    def edit
    end

    def update 
      if @schedule.update(set_params)
        flash[:success] = t :success
        redirect_to agenda_schedules_path(@agenda)
      else
        render action: 'edit'
      @agenda = Schedule::Agenda.find(params[:agenda_id])
      end
    end

    def cancel
      @schedule = Schedule::AgendaSchedule.find(params[:schedule_id])
      
      if @schedule.update(status: 1, observation: "agendamento liberado. atendente #matricula #{current_user.account.code}")
        flash[:success] = t :success
      else
        flash[:danger] =  t :danger
      end

      redirect_to agenda_schedules_path(@agenda)
    end

    private

    def set_schedule
      @schedule = Schedule::AgendaSchedule.find(params[:id])
    end

    def set_params
      params.require(:agenda_schedule).permit(:status, :observation)
    end

    def set_agenda
      @agenda = Schedule::Agenda.find(params[:agenda_id])
    end
  end
end