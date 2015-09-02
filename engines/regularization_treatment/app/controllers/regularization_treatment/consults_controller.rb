require_dependency 'regularization_treatment/application_controller'

module RegularizationTreatment
  class ConsultsController < ApplicationController

    def new
      @consult = Consult.new
      session[:cadastre_id] = nil if session[:cadastre_id].present?
      session[:requeriment_id] = nil if session[:requeriment_id].present?
    end

    def create
      @consult = Consult.new(set_params)

      if @consult.valid?
        @requeriments = Regularization::Requeriment.where(cpf: @consult.cpf)
        @schedules = RegularizationSchedule::Schedule.where(cpf: @consult.cpf)
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