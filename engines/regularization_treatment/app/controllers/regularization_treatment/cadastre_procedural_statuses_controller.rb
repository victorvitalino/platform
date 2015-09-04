module RegularizationTreatment
  class CadastreProceduralStatusesController < ApplicationController
    before_action :set_cadastre
    before_action :set_step

    def new
      @cadastre_procedural_status = Candidate::CadastreProceduralStatus.new
      @attendance = ::Candidate::AttendanceCadastre.where(adjunct_cadastre_id: @cadastre.adjunct_cadastre.id)
      @checklist = Candidate::ChecklistTreatment.where(attendance_cadastre_id: @attendance, status: true)
    end

    def create
      @cadastre_procedural_status = Candidate::CadastreProceduralStatus.new(set_params)
      create_assessment
      @cadastre_procedural_status.assessment_id = @assessment.id
      @cadastre_procedural_status.adjunct_cadastre_id = @cadastre.adjunct_cadastre.id
      if @cadastre_procedural_status.save
        @cadastre.set_treatment(1,4,@cadastre.adjunct_cadastre.id)
        redirect_to new_consult_path
      else
        render action: 'new'
      end
    end

    def create_assessment
       @assessment = Protocol::Assessment.new
       @assessment.set_staff(current_user.account_id)
       @assessment.cpf = session[:cpf]
       @assessment.recipient = @cadastre.adjunct_cadastre.name
       @assessment.document_type_id = 1
       @assessment.subject_id = 1
       @assessment.requesting_unit = 'DIREG'
       @assessment.save
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
      params.require(:cadastre_procedural_status).permit(:adjunct_cadastre_id, :procedural_status_id, :observation, :convocation, :assessment_id)
    end
  end
end
