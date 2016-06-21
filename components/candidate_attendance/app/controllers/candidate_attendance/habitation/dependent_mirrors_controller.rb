require_dependency 'candidate_attendance/application_controller'

module CandidateAttendance
  module Habitation
    class DependentMirrorsController < ApplicationController
      before_action :set_attendance
      before_action :set_cadastre_mirror

      def index
        @cadastre_mirror
      end

      def new
        @dependent_mirror = @cadastre_mirror.dependent_mirrors.new
      end

      def create
        @dependent_mirror = @cadastre_mirror.dependent_mirrors.new(set_params)
        @dependent_mirror.save
      end

      def edit
        @dependent_mirror = @cadastre_mirror.dependent_mirrors.find(params[:id])
      end

      def update
        @dependent_mirror = @cadastre_mirror.dependent_mirrors.find(params[:id])
        @dependent_mirror.update(set_params)
      end

      
      private
      
      def set_params
        params.require(:dependent_mirror).permit(:cpf, :rg, :rg_org, :name, :born, :gender, :civil_state_id,
                                               :kinship_id, :income, :special_condition_id, :nis, :cid, 
                                               :co_acquirer, :percentage)
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