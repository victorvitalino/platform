require_dependency 'candidate_attendance/application_controller'

module CandidateAttendance
  module Habitation
    class DashboardController < ApplicationController
      
      def index
        @candidate = Candidate::Cadastre.habitation.find_by_cpf(params[:cpf]) rescue nil
      end
      
    end
  end
end