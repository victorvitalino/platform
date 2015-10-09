require_dependency 'regularization/application_controller'

module Regularization
  class SchedulesController < ApplicationController 
    before_action :set_agenda

    def index
      @schedules = @agenda.agenda_schedules
    end
    
    private

    def set_agenda
      @agenda = Schedule::Agenda.find(params[:agenda_id])
    end
  end
end