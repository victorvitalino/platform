require_dependency 'habitation_attendance/application_controller'

module HabitationAttendance
  module Enabled
    class DashboardController < ApplicationController
    
      def index
        @candidate = Cadastre.habitation.situation(4).find_by_cpf(params[:cpf].unformat_cpf) rescue nil
      end

    end
  end
end
