require_dependency 'habitation_attendance/application_controller'

module HabitationAttendance
  class DashboardController < ApplicationController

    def search
      @candidate = Cadastre.habitation.find_by_cpf(params[:cpf].unformat_cpf) rescue nil
    end

  end
end