require_dependency 'habitation_attendance/application_controller'

module HabitationAttendance
  module Enabled
    class AttendancesController < ApplicationController
    
      def new      
        @attendance = Enabled::Attendance.new

        if @attendance.initialize_attendance!(params[:cpf], current_user.id)
          flash[:success] =  "Atendimento iniciado com sucesso!"
        else
          flash[:danger]  =  "Não foi possível iniciar o atendimento! Verifique se existe atendimentos em aberto."
        end
        
        redirect_to enabled_dashboard_index_path(cpf: params[:cpf])
      end

      def destroy
      end

    end
  end
end