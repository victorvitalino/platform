require_dependency 'candidate_attendance/application_controller'

module CandidateAttendance
  module Habitation
    class ChecklistsController < ApplicationController
      before_action :set_attendance
      before_action :set_cadastre_mirror
      before_action :set_type_checklist

      def index
        
      end

      def check
        @checklist = Candidate::Checklist.find(params[:checklist_id])
        @mirror_check = @cadastre_mirror.cadastre_checklists.new
        @mirror_check.checklist_id = @checklist.id
        @mirror_check.save
      end

      def uncheck
        @checklist = Candidate::Checklist.find(params[:checklist_id])
        @mirror_check = @cadastre_mirror.cadastre_checklists.find_by_checklist_id(@checklist.id)
        @mirror_check.destroy
      end

      def auth
        @checklist = Candidate::Checklist.find(params[:checklist_id])
        @mirror_check = @cadastre_mirror.cadastre_checklists.find_by_checklist_id(@checklist.id)
        @mirror_check.update(document_authenticate: true)
      end

      def unauth
        @checklist = Candidate::Checklist.find(params[:checklist_id])
        @mirror_check = @cadastre_mirror.cadastre_checklists.find_by_checklist_id(@checklist.id)
        @mirror_check.update(document_authenticate: false)
      end

      private

      def set_type_checklist
        @type = Candidate::ChecklistType.find_by_name('morar_bem')
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
