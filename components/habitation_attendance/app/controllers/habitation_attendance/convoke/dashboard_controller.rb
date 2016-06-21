require_dependency 'habitation_attendance/application_controller'

module HabitationAttendance
  module Convoke
    class DashboardController < ApplicationController
    
      def index
        @candidate = Candidate::Cadastre.habitation.situation(3).find_by_cpf(params[:cpf].unformat_cpf) rescue nil
      end

    end
  end
end
