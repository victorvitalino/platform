require_dependency 'habitation/application_controller'

module Habitation
  module Attendance
    class AttendancesController < ApplicationController
      
      def index
        @candidate = Candidate::Cadastre.find_by_cpf(params[:cpf]) rescue nil
      end

      def new
      end

      def create
      end

    end
  end
end