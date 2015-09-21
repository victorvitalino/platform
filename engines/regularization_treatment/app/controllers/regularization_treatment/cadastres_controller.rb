module RegularizationTreatment
  class CadastresController < ApplicationController
    before_action :set_step
    before_action :set_requeriment

    def new
      @cadastre = Regularization::Cadastre.find_by_cpf(@requeriment.cpf)
      if !@cadastre.present? 
         @cadastre = Regularization::Cadastre.new
         @cadastre.adjunct_cadastres.build
      end
    end

    def edit
      @cadastre = Regularization::Cadastre.find_by_cpf(@requeriment.cpf)
    end

    def update
      @cadastre = Regularization::Cadastre.find_by_cpf(@requeriment.cpf)
      if @cadastre.update(set_params)
        session[:cadastre_id] = @cadastre.adjunct_cadastres.last.id
        redirect_to requeriment_kin_step_path(@requeriment)
      else
        render :new
      end
    end

    def show
        render layout: 'layouts/regularization_treatment/application'
    end

    def create
      @cadastre = Regularization::Cadastre.new(set_params)
      if @cadastre.save
        session[:cadastre_id] = @cadastre.adjunct_cadastres.last.id
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
      params.require(:cadastre).permit(:rg,:place_birth,:born,:cpf,:name,:state_id,:city_id,:cep,:address,:adjunct_address,
                                       :number_address,:telephone,:telephone_optional,:celphone,:email,:work,:cep_work,:address_work,
                                       :adjunct_address_work,:number_address_work,:city_work_id,:state_work_id,
                                       adjunct_cadastres_attributes: [:civil_state_id,:flag_special_condition,:special_condition_id,
                                       :cid, :income,:nis])
    end
  end
end
