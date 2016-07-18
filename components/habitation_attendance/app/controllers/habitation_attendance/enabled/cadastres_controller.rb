require_dependency 'habitation_attendance/application_controller'

module HabitationAttendance
  module Enabled
    class CadastresController < ApplicationController
    
      def show
        @mirror = Candidate::CadastreMirror.find(params[:id])
      end

      
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

      def checklist
        @mirror = Candidate::CadastreMirror.find(params[:cadastre_id])

        render layout: 'patternfly/less-application'
      end
    end
  end
end
