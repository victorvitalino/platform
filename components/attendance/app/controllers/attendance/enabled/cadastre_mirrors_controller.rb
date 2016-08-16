require_dependency 'attendance/application_controller'

module Attendance
  module Enabled
    class CadastreMirrorsController < ApplicationController
     
      before_action :set_cadastre_mirror, only: [:edit, :update]
     
      def init
        @candidate = Candidate::Cadastre.find(params[:cadastre_mirror_id])
        @mirror    = Attendance::MirrorService.new 

        if @mirror.clone_to_mirror(@candidate.id)
          logger = Attendance::LoggerService.new(set_params_logger)
          logger.write_logger

          redirect_to edit_enabled_cadastre_mirror_path(@mirror.mirror_id)
        else
          redirect_to detail_path(@candidate.cpf)
        end
      end

      def edit
      end

      def update
        if @cadastre_mirror.update(set_params_update_mirror)
          flash[:success] = t :success
          redirect_to edit_enabled_cadastre_mirror_path(@cadastre_mirror.id)
        else
          flash[:danger] = t :danger
          render action: :edit
        end

      end

      private

      def set_params_update_mirror
        params.require(:enabled_cadastre_mirror).permit(:civil_state_id, :born, :gender, :arrival_df, 
                                                :income, :special_condition_id, :adapted_property, :cid, :nis)

      end

      def set_cadastre_mirror
        @cadastre_mirror = Attendance::Enabled::CadastreMirror.find(params[:id])
      end

      def set_params_logger
        { staff_id: current_user.id, cadastre_id: @candidate.id, cadastre_mirror_id: @mirror.mirror_id,
          attendance_type_id: 2, schedule_id: session[:schedule_id], status: 0, start: Time.now }
      end
      
    end
  end
end