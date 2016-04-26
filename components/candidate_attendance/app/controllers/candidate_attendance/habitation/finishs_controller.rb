require_dependency 'candidate_attendance/application_controller'

module CandidateAttendance
  module Habitation
    class FinishsController < ApplicationController
      
      before_action :set_attendance
      before_action :set_cadastre_mirror
      before_action :set_checklists

      def new
        @supervisor_finish = CadastreProcedural.new
        @attendance_finish = CadastreProcedural.new
      end

      def supervisor_check
        @supervisor_finish = CadastreProcedural.new(set_supervisor_params)
        @supervisor_finish.staff_id = current_user.id
        @supervisor_finish.cadastre_mirror_id = @cadastre_mirror.id
        @supervisor_finish.cadastre_id = @cadastre_mirror.cadastre_id

        if @supervisor_finish.save
          
        else
          flash[:danger] =  'Não foi possível finalizar o atendimento. Favor verifique as informações fornecidas.'
          render action: :new
        end      
      end

      def supervisor_update
      end
      

      def attendance_check
      end

      private

      def set_supervisor_params
        params.require(:habitation_cadastre_procedural).permit(:procedural_status_id, :observation)
      end

      def set_checklists
        @type = Candidate::ChecklistType.find_by_name('morar_bem') rescue nil

        if @type.present?
          @checklists = @type.checklists
        else
          @checklists = {}
        end
      end

      def set_cadastre_mirror
        @cadastre_mirror = Candidate::CadastreMirror.find(@attendance.cadastre_mirror_id)
      end

      def set_attendance
        @attendance = Candidate::CadastreAttendance.find(params[:cadastre_attendance_id])
      end
      
    end
  end
end