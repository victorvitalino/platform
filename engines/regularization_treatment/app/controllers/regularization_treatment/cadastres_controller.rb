module RegularizationTreatment
  class CadastresController < ApplicationController
    before_action :set_step

    def new
      @cadastre = Candidate::Cadastre.new
    end

    def create
      @cadastre = Candidate::Cadastre.new(set_params)

      if @cadastre.save
      
      else
        render action: 'new'
      end

    end

    private

    def set_step
      @step = "cadastre"
    end

    def set_params
      params.require(:cadastre).permit(:cpf)
    end
  end
end