require_dependency 'candidate_attendance/application_controller'

module CandidateAttendance
  module Habitation
    class ChecklistsController < ApplicationController
      before_action :set_attendance
      before_action :set_cadastre_mirror

      def index
        @candidate = Candidate::Cadastre.habitation.find_by_cpf(params[:cpf]) rescue nil
      end

      private

      def set_cadastre_mirror
        @cadastre_mirror = Candidate::CadastreMirror.find(@attendance.cadastre_mirror_id)
      end

      def set_attendance
        @attendance = Candidate::CadastreAttendance.find(params[:cadastre_attendance_id])
      end
      
    end
  end
end