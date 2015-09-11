module RegularizationTreatment
  class CadastresController < ApplicationController
    before_action :set_step
    before_action :set_requeriment, except: [:show]
    before_action :set_cadastre, only: [:show]

    def new
      if session[:cadastre_id].present?
        @cadastre = Regularization::Cadastre.find(session[:cadastre_id])
      else
        @cadastre = Regularization::Cadastre.new
        @cadastre.build_adjunct_cadastre
      end
    end

    def show

    end

    def create
      @cadastre = Regularization::Cadastre.new(set_params)
      @cadastre.cpf = @requeriment.cpf

      if @cadastre.save
        @cadastre.set_treatment(1,1,@cadastre.adjunct_cadastre.id)
        session[:cadastre_id] =  @cadastre.id
        redirect_to new_kin_path
      else
        render action: 'new'
      end

    end

    private

    def set_step
      @step = "cadastre"
    end

    def set_cadastre
       @cadastre =   Regularization::Cadastre.find(params[:id])
    end

    def set_requeriment
      @requeriment = Regularization::Requeriment.find(session[:requeriment_id])
    end

    def set_params
      params.require(:cadastre).permit(:id,:rg,:place_birth,:born,
                                                          adjunct_cadastre_attributes: [:id,:name,:civil_state_id,:flag_special_condition,:special_condition_id,
                                                          :cid,:state_id,:city_id,:cep, :address,:adjunct_address,:number_address, :income,:nis,:telephone,:telephone_optional,
                                                          :celphone,:email,:work,:cep_work,:address_work,:adjunct_address_work,:number_address_work,
                                                          :city_work_id,:state_work_id])
    end
  end
end
