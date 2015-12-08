require_dependency 'schedule_portal/application_controller'
module SchedulePortal
  module Candidate
    class VerificationsController < ApplicationController
    
      def new
        session[:candidate_cpf] = nil
        @verification = Schedule::Verification.new
      end

      def create
        @verification = Schedule::Verification.new(set_params)
        if @verification.valid?
          session[:candidate_cpf] = @verification.cpf
          session[:candidate_expiration] = Time.now + 2.hour
          redirect_to candidate_schedules_path
        else
          render action: 'new'
        end
      end

      private

      def set_params
        params.require(:verification).permit(:cpf, :born, :telephone, :email)
      end

      
    end
  end
end