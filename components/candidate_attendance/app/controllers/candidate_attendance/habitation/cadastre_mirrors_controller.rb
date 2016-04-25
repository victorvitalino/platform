require_dependency 'candidate_attendance/application_controller'

module CandidateAttendance
  module Habitation
    class CadastreMirrorsController < ApplicationController
      before_action :set_attendance
      before_action :set_cadastre

      def edit
        @cadastre_mirror = Candidate::CadastreMirror.find(@attendance.cadastre_mirror_id)
      end

      def update
        @cadastre_mirror = Candidate::CadastreMirror.find(@attendance.cadastre_mirror_id)

        if @cadastre_mirror.update(set_params)
          flash[:success] =  t :success
          redirect_to action: :edit
        else
          flash[:danger] =  t :success
          redirect_to action: :edit
        end
      end

      private

      def set_params
        params.require(:cadastre_mirror).permit(:born, :gender, :civil_state, :arrival_df, :income,
                                                :special_condition_id, :adapted_property, :cid, :nis)
      end

      def set_cadastre
        @cadastre = Candidate::Cadastre.find(@attendance.cadastre_id)
      end

      def set_attendance
        @attendance = Candidate::CadastreAttendance.find(params[:cadastre_attendance_id])
      end
      
    end
  end
end