require_dependency 'attendance/application_controller'

module Attendance
  module Basic
    class CadastresController < ApplicationController
      
      def edit
        @cadastre = Candidate::Cadastre.find_by_cpf(params[:id]) rescue nil
      end

      def update
      end
    end

  end
end