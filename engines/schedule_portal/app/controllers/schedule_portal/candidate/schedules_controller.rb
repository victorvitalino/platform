require_dependency 'schedule_portal/application_controller'
module SchedulePortal
  module Candidate
    class SchedulesController < ApplicationController
      before_action :verification_valid?

      def index
        
        @cpf = session[:candidate_cpf]
      end

      def show
        @schedule = @schedules.find(params[:id])
     end


      private

      def verification_valid?
        if !session[:candidate_cpf].present?
          redirect_to candidate_new_verification_path
        else
          @schedules = Schedule::AgendaSchedule.where(cpf: session[:candidate_cpf])
        end
      end
    end
  end
end