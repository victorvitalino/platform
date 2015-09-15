module RegularizationTreatment
  class ChecklistTreatmentsController < ApplicationController
    before_action :set_cadastre,except: [:show]
    before_action :set_step
    before_action  :set_cadastre_show, only: [:show]

    def new
      @checklist = Candidate::Checklist.all
      @checklist_treatment = Candidate::ChecklistTreatment.new
    end

    def show
       @requeriment = Regularization::Requeriment.find_by_cpf(@cadastre.cpf)
       render layout: 'layouts/regularization_treatment/application'
    end

    def create
       @attendance = ::Candidate::AttendanceCadastre.where(adjunct_cadastre_id: @cadastre.adjunct_cadastre.id).last
      params[:checklist_treatment].each do |id, value|
        @checklist_treatment = Candidate::ChecklistTreatment.new({checklist_id: id, status: value})
        @checklist_treatment.attendance_cadastre_id =  @attendance.id
        @checklist_treatment.save
      end
        @cadastre.set_treatment(1,3,@cadastre.adjunct_cadastre.id,current_user.account.attendant.id)
      redirect_to new_cadastre_procedural_status_path
    end

    private

    def set_cadastre_show
         @cadastre = Regularization::Cadastre.find(params[:id])
    end

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