require_dependency 'habitation_treatment/application_controller'

module HabitationTreatment
  class ConsultsController < ApplicationController

    def new
      @consult = HabitationTreatment::Consult.new
      session[:cadastre_id] = nil if session[:cadastre_id].present?
    end

    def create
      @consult = Consult.new(set_params)

      if @consult.valid?
          @cadastre_olds = Regularization::Cadastre.where(cpf: @consult.cpf)
        if @cadastre_olds.present?
          @adjunct_olds = Candidate::AdjunctCadastre.where(cadastre_id: @cadastre_olds)
          @attendance = ::Candidate::AttendanceCadastre.where(adjunct_cadastre_id: @adjunct_olds)
        end
        render action: 'new'
      else
        render action: 'new'
      end
    end

    private

    def set_params
      params.require(:consult).permit(:cpf)
    end
  end
end