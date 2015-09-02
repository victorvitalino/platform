module RegularizationTreatment
  class CadastreProceduralStatusesController < ApplicationController
    before_action :set_cadastre
    before_action :set_step

    def new
      @cadastre_procedural_status = Candidate::CadastreProceduralStatus.new
      @attendance = ::Candidate::AttendanceCadastre.where(adjunct_cadastre_id: @cadastre.adjunct_cadastre.id)
      @checklist = Candidate::ChecklistTreatment.where(attendance_cadastre_id: @attendance)
    end

    def create
      @cadastre_procedural_status = Candidate::CadastreProceduralStatus.new(set_params)
      if @cadastre_procedural_status.save
        @cadastre.set_treatment(1,4,@cadastre.adjunct_cadastre.id)
        render new_consult_path
      else
        render action: 'new'
      end

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
      @step = "final"
    end

    def set_params
      params.require(:cadastre_procedural_status).permit(:adjunct_cadastre_id)
    end
  end
end
