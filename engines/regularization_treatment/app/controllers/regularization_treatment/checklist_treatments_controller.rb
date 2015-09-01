module RegularizationTreatment
  class ChecklistTreatmentsController < ApplicationController
    before_action :set_step

    def new
      @checklist = Candidate::Checklist.all
      @checklist_treatment = Candidate::ChecklistTreatment.new
      @candidate = Candidate::Cadastre.where(cpf: session[:cpf])
    end

    def create
    end

    private

    def set_step
      @step = 'checklist'
    end

  end
end