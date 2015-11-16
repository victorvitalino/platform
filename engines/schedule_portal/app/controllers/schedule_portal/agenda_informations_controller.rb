require_dependency 'schedule_portal/application_controller'

module SchedulePortal
  class AgendaInformationsController < ApplicationController

    def all
      if params[:id].present?
        @agenda = Schedule::Agenda.find(params[:id])
        render json: [@agenda, (Date.today + 1.day).strftime('%d/%m/%Y'), @agenda.end.strftime("%d/%m/%Y")]
      else
        render json: 'not found'
      end
    end

    def hours
      if params[:id].present?
        @agenda = Schedule::Agenda.find(params[:id])
        render json: @agenda.hours(Date.parse(params[:date]))
      else
        render json: 'not found'
      end
    end
  end
end