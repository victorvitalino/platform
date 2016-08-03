require_dependency 'attendance/application_controller'

module Attendance
  module Basic
    class CadastresController < ApplicationController
      before_action :set_cadastre

      def edit
      end

      def update
        logger = Attendance::LoggerService.new(set_params_logger)
        logger.write_logger if @cadastre.update(set_params)
      end

      private

      def set_cadastre
        @cadastre = Attendance::Basic::Cadastre.find(params[:id]) rescue nil
      end

      def set_params
        params.require(:basic_cadastre).permit(:telephone, :telephone_optional, :celphone, :email, :cep, 
                                               :city_id, :address, :address_complement, :work_cep, 
                                               :work_address)
      end

      def set_params_logger
        {
         staff_id:            current_user.id,
         supervisor_id:       current_user.id, 
         cadastre_id:         @cadastre.id,
         attendance_type_id:  1,
         schedule_id:         session[:schedule_id],
         status:              1,
         start:               Time.now,
         end:                 Time.now
        }
      end
    end
  end
end

