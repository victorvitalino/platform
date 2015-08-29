module RegularizationTreatment
  class CadastresController < ApplicationController
    before_action :set_step

    def new
      @cadastre = Regularization::Cadastre.new
      @cadastre.build_adjunct_cadastre
    end

    def create
      @cadastre = Regularization::Cadastre.new(set_params)

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