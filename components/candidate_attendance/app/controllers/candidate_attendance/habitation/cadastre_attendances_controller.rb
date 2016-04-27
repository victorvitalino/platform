require_dependency 'candidate_attendance/application_controller'

module CandidateAttendance
  module Habitation
    class CadastreAttendancesController < ApplicationController
      before_action :set_attendance, only: [:show_apresentation, :show_cadastre, :show_checklist, :show_rejection]

      def new
        @cadastre = Candidate::Cadastre.habitation.find_by_cpf(params[:cpf]) rescue nil

        if Candidate::CadastreAttendance.initialize_attendance!(@cadastre, current_user.id)
          flash[:success] =  "Atendimento iniciado com sucesso!"
        else
          flash[:danger]  =  "Não foi possível iniciar o atendimento! Verifique se existe atendimentos em aberto."
        end
        
        redirect_to habitation_root_path(cpf: @cadastre.cpf)
      end
      

      def destroy
        @attendance = Candidate::CadastreAttendance.find(params[:id])
        if @attendance.destroy
          flash[:success] =  "Atendimento cancelado com sucesso"
        else
          flash[:danger]  = "Não foi possível cancelar o atendimento"
        end

        redirect_to habitation_root_path(cpf: @attendance.cadastre.cpf)
      end

      def show
        @attendance = Candidate::CadastreAttendance.find(params[:id])
      end

      def show_apresentation
        render layout: 'patternfly/less-application' 
      end

      def show_cadastre
        render layout: 'patternfly/less-application' 
      end

      def show_checklist
        render layout: 'patternfly/less-application' 
      end

      def show_rejection
        render layout: 'patternfly/less-application' 
      end

      private

      def set_attendance
        @attendance = Candidate::CadastreAttendance.find(params[:attendance_id])
      end
    end
  end
end