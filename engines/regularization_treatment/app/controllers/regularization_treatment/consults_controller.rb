require_dependency 'regularization_treatment/application_controller'

module RegularizationTreatment
  class ConsultsController < ApplicationController

    def new
      if params[:cpf].present?
        @requeriments = Regularization::Requeriment.where(cpf: params[:cpf])
        @schedules    = RegularizationSchedule::Schedule.where(cpf: params[:cpf])
        @attendances  = Candidate::AttendanceCadastre.where(requeriment_id: [@requeriments.map(&:id)], status: true)
        @consult = Consult.new(cpf: params[:cpf])
      else
        @consult = Consult.new
      end
    end

    def create
      @consult = Consult.new(set_params)

      if @consult.valid?
        @requeriments = Regularization::Requeriment.where(cpf: @consult.cpf)
        @schedules    = RegularizationSchedule::Schedule.where(cpf: @consult.cpf)
        @attendances  = Candidate::AttendanceCadastre.where(requeriment_id: [@requeriments.map(&:id)], status: true)
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