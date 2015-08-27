require_dependency "regularization_schedule/application_controller"

module RegularizationSchedule
  class Portal::AgendasController < ApplicationController

   layout 'layouts/portal/application'

    # GET /agendas
    def index
        @agendas = Agenda.where('start <= ? and regularization_schedule_agendas.end >= ?', Time.now,Time.now)
    end

    # GET /agendas/1

    private
      # Use callbacks to share common setup or constraints between actions.

      # Only allow a trusted parameter "white list" through.
      def agenda_params
        params.require(:agenda).permit(:title, :description, :start, :end, :hour_start,
                                                          :hour_end, :publish, :city_id, :station_id, :quantity_attendants,
                                                          :time_attendant, :lunch, :lunch_start, :lunch_end, :lunch_attendants,
                                                          :lunch_time_attendant, :validate_sql, :validate_type, :validate_agenda)
      end
  end
end
