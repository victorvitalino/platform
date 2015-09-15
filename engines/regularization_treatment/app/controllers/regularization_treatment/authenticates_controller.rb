module RegularizationTreatment
  class AuthenticatesController < ApplicationController

    before_action :set_cadastre, only:[:new]

    def new
       #refatorar
       @authenticate = RegularizationTreatment::Authenticate.new
       @id = params[:id]

    end

    def create
      @authenticate = RegularizationTreatment::Authenticate.new(set_params)
      if @authenticate.valid?
        @user = User.find_by_username(@authenticate.login)
        @cadastre_procedural_status = Candidate::CadastreProceduralStatus.new
        @cadastre_procedural_status.adjunct_cadastre_id = @cadastre.adjunct_cadastre.id
        @cadastre_procedural_status.assessment_id  = Candidate::CadastreProceduralStatus.where(adjunct_cadastre_id: @cadastre.adjunct_cadastre.id).last
        @cadastre_procedural_status.procedural_status = @authenticate.procedural_status
        @cadastre_procedural_status.observation = @authenticate.observation
        @cadastre_procedural_status.attendant = @user .id

          @cadastre.set_treatment(1,5,@cadastre.adjunct_cadastre.id, @user .id)
           flash[:info] = "Atendimento finalizado com sucesso."
      else
           flash[:danger] = "Você não está autorizado a fnalizar este Atendimento."
      end
       redirect_to new_consult_path
    end

    private

    def set_params
        params.require(:authenticate).permit(:id,:login,:password,:procedural_status, :description)
    end

    def set_cadastre
       @cadastre =   Regularization::Cadastre.find(params[:cadastre_id])
    end

    def set_step
      @step = "address"
    end
  end
end