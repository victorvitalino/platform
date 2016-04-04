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

      def destroy
        @mirror = Candidate::CadastreMirror.find(params[:id]) rescue nil

        if @mirror.destroy 
          redirect_to action: index, cpf: @mirror.cpf
          flash[:success] = t :success
        else
          redirect_to action: index, cpf: @mirror.cpf
          flash[:danger] = "Não foi possível cancelar o atendimento"
        end
      end

    end
  end
end