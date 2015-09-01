module RegularizationTreatment
  class ChecklistTreatmentsController < ApplicationController
    before_action :set_cadastre
    before_action :set_step

    def new
      @checklist = Candidate::Checklist.all
      @checklist_treatment = Candidate::ChecklistTreatment.new
    end

    def create
      params[:checklist_treatment].each do |id, value|
        @checklist_treatment = Candidate::ChecklistTreatment.new({checklist_id: id, status: value})
        @checklist_treatment.save
      end

      redirect_to action: new
    end

    private

    def set_cadastre
      if session[:cadastre_id].present?
        @cadastre = Regularization::Cadastre.find(session[:cadastre_id])
      else
        flash[:info] = "É necessario preencher o cadastro."
        redirect_to new_cadastre_path
      end
    end

    def set_step
      @step = 'checklist'
    end

  end
end