require_dependency 'schedule_portal/application_controller'

module SchedulePortal
  module Habitation
    class AgendaSchedulesController < ApplicationController
    
      def new
        @schedule = Schedule::AgendaSchedule.new
      end

      def create
        @schedule = Schedule::AgendaSchedule.new(set_params)

        if @schedule.save
          session[:schedule_id] = @schedule.id
          redirect_to action: 'show', id: @schedule.id
        else
          render action: 'new'
        end
      end

      def edit
      end

      def update
      end

      def show
        if session[:schedule_id].present?
          @schedule = Schedule::AgendaSchedule.find(session[:schedule_id])
        else
          redirect_to action: 'new'
        end
      end

      private

      def set_params
        params.require(:agenda_schedule).permit(:date, :hour, :agenda_id, :name, :cpf, :telephone, :telephone_optional, :celphone, :email,:observation)
      end

    end
  end
end