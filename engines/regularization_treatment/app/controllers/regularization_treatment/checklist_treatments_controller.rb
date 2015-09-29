module RegularizationTreatment
  class ChecklistTreatmentsController < ApplicationController

    before_action :set_requeriment
    before_action :set_station_attendant
    before_action :set_checklist, only: [:new]

    def index
    end

    def new
      @checklist = Candidate::ChecklistTreatment.new
    end

    def create
      params[:checklist_treatment].each do |key, value|
        @checklist = Candidate::ChecklistTreatment.new
        @checklist.checklist_id             = key
        @checklist.status                   = value
        @checklist.attendance_cadastre_id   = 1
        @checklist.attendant_id             = current_user.account.attendant.id
        @checklist.save
      end

    end
      
    private

    def set_checklist
      @checklists = Candidate::Checklist.informal_installment if @station.parcelamento_informal?
      @checklists = Candidate::Checklist.consolidated_city if @station.cidade_consolidada?
    end

    def set_requeriment
      @requeriment = Regularization::Requeriment.find(params[:requeriment_id])
    end

    def set_station_attendant
      if current_user.account.attendant.present? && current_user.account.attendant.station.present?
        @station = current_user.account.attendant.station
      else
        flash[:danger] = "Atendente não está vínculado a nenhum posto de atendimento."
        redirect_to new_consult_path
      end
    end
  end
end