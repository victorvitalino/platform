require_dependency 'regularization/application_controller'

module Regularization
  class AgendasController < ApplicationController 
    before_action :set_agenda, only: [:edit, :update, :destroy, :show]
    
    def index
      @agendas = Schedule::Agenda.regularization
    end
  
    def new
      @agenda = Schedule::Agenda.regularization.new
    end

    def edit
    end

    def show
      @schedules = @agenda.agenda_schedules
    end
    
    def create
      @agenda = Schedule::Agenda.regularization.new(set_params)
      if @agenda.save
        flash[:success] = t :success
        redirect_to action: 'index'
      else
        render action: 'new'
      end

    end

    def update
      if @agenda.update(set_params)
        flash[:success] = t :success
        redirect_to action: 'index'
      else
        render action: 'edit'
      end
    end

    private

    def set_params
      params.require(:agenda).permit(:title, :description, :avatar, :start, :end, :disable_dates,
                                 :start_hour, :end_hour, :attendance_time, :attendants, :weekend,
                                 :lunch_time, :lunch_attendants, :lunch_start, :lunch_end, :restriction_type,
                                 :restriction_sql, :status, :exclude_date)

    end

    def set_agenda
      @agenda = Schedule::Agenda.regularization.find(params[:id])
    end


  end
end