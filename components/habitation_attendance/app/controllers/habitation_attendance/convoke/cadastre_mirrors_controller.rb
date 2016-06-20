require_dependency 'habitation_attendance/application_controller'

module HabitationAttendance
  module Convoke
    class CadastreMirrorsController < ApplicationController
    
      def edit
        @cadastre_mirror = Candidate::CadastreMirror.find(params[:id])
      end

      def update
        @cadastre_mirror = Candidate::CadastreMirror.find(params[:id])
        if @cadastre_mirror.update(set_params)
          flash[:success] = t :success
          redirect_to action: :edit
        else
          render action: :edit
        end
      end

      private

      def set_params
        params.require(:cadastre_mirror).permit(:born, :gender, :civil_state_id, :arrival_df,
                                               :income, :special_condition_id, :adapted_property,
                                               :cid, :nis)
      end
    end
  end
end