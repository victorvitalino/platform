require_dependency 'habitation/application_controller'

module Habitation
  class CadastresController < ApplicationController 
    before_action :set_cadastre, only: [:edit, :update]
    def index
      @cadastre = Candidate::Cadastre.find_by_cpf(params[:cpf])
    end
    
    def edit
    end

    def update
      @old = @cadastre

      if @cadastre.update(set_params) && @cadastre.save_log(@old, @cadastre, current_user.account_id)
        flash[:success] = t :success
        redirect_to cadastres_path(cpf: @cadastre.cpf)
      else
        render action: 'edit'
      end
    end

    private

    def set_cadastre
      @cadastre = Candidate::Cadastre.find(params[:id])
    end

    def set_params
      params.require(:cadastre).permit(:name, :gender, :born, :born_uf, :rg, :rg_org, :rg_uf, 
                                       :place_birth, :arrival_df, :telephone, :telephone_optional,
                                       :celphone, :email, :civil_state_id, :city_id, :address,
                                       :address_complement, :cep, :income, :nis, :cid, :special_condition_id,
                                       :adapted_property, :work_city_id, :work_address, :work_cep,
                                       :password, :password_confirmation, dependents_attributes: [:name,
                                        :cpf, :rg, :rg_org, :rg_uf_id, :born, :gender, :place_birth, :civil_state_id,
                                        :income, :kinship_id, :special_condition_id, :co_acquirer,
                                        :percentage, :cid, :nis, :_destroy, :id] )
    end
  end
 
end