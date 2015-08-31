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
        render new_kin_path
      else
        render action: 'new'
      end

    end

    private

    def set_step
      @step = "cadastre"
    end

    def set_params
      params.require(:cadastre).permit(:id,:rg,:place_birth,:born,:cpf,
                                                          adjunct_cadastre_attributes: [:id,:name,:civil_state_id,:flag_special_condition,:special_condition_id,
                                                          :cid,:state_id,:city_id,:cep, :address,:adjunct_address,:number_address, :income,:nis,:telephone,:telephone_optional,
                                                          :celphone,:email,:work,:cep_work,:address_work,:adjunct_address_work,:number_address_work])
    end
  end
end
