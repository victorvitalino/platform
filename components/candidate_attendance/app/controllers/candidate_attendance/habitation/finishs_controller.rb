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
        # => Isso ta complexo bagaraio! Faz um favor!? **Otimize-me**
        @supervisor_finish = CadastreProcedural.new(set_supervisor_params)
        @supervisor_finish.staff_id = current_user.id
        @supervisor_finish.cadastre_mirror_id = @cadastre_mirror.id
        @supervisor_finish.cadastre_id = @cadastre_mirror.cadastre_id

        if @supervisor_finish.save

        else
          flash[:danger] = 'Não foi possível finalizar o atendimento. Favor verifique as informações fornecidas.'
          render action: :new
        end      
      end

      def supervisor_update
        
        @log = Candidate::AttendanceLog.new
        @log.cadastre_mirror_id   = @cadastre_mirror.id
        @log.cadastre_id          = @cadastre_mirror.cadastre_id
        @log.user_id              = current_user.id
        @log.attendance_status_id = 1

        if @log.save
          attendance = @cadastre_mirror.cadastre_attendances.new
          attendance.cadastre_id = @cadastre_mirror.cadastre_id
          attendance.attendance_status_id = 6 # => atendimento finalizado
          attendance.staff_id = current_user.id
          attendance.save

          flash[:success] =  t :success
          redirect_to habitation_root_path(cpf: @cadastre_mirror.cpf)

        else
          render action: :new
        end
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