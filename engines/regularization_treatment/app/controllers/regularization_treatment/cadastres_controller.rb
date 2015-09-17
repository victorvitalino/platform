module RegularizationTreatment
  class CadastresController < ApplicationController
    before_action :set_step
    before_action :set_requeriment

    def new
      @cadastre = Regularization::Cadastre.find_by_cpf(@requeriment.cpf).present?
      
      redirect_to edit_requeriment_cadastre_path(requeriment_id: @requeriment, id: @cadastre) if @cadastre.present?

    end

    def edit
      @cadastre = Regularization::Cadastre.find_by_cpf(@requeriment.cpf)
      @cadastre.adjunct_cadastres.new
    end


    def show
        render layout: 'layouts/regularization_treatment/application'
    end

    def create
      @cadastre = Regularization::Cadastre.new(set_params)
      if @cadastre.save
        redirect_to requeriment_kin_step_path(@requeriment)
      else
        render action: 'new'
      end

    end

    private

    def set_step
      @step = "cadastre"
    end

    def set_requeriment
      @requeriment = Regularization::Requeriment.find(params[:requeriment_id])
    end

    def set_params
      params.require(:cadastre).permit(:id,:rg,:place_birth,:born, :cpf,
                                       adjunct_cadastres_attributes: [:id,:name,:civil_state_id,:flag_special_condition,:special_condition_id,
                                       :cid,:state_id,:city_id,:cep, :address,:adjunct_address,:number_address, :income,:nis,:telephone,:telephone_optional,
                                       :celphone,:email,:work,:cep_work,:address_work,:adjunct_address_work,:number_address_work,
                                       :city_work_id,:state_work_id])
    end
  end
end
