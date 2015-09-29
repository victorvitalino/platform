module RegularizationTreatment
  class KinsController < ApplicationController
    before_action :set_requeriment
    before_action :set_step
    before_action :set_cadastre

    def new
      @kin  = @cadastre.kins.new 
    end

    def create
      @kin = @cadastre.kins.new(set_params)
      @kin.save
    end

    def delete
      @kin = Regularization::Kin.find(params[:kin_id])
    end

    def destroy
      @kin = Regularization::Kin.find(params[:id])
      @kin.update(status: false)

    end

    private

    def set_cadastre
      if session[:cadastre_id].present?
        @cadastre = Regularization::AdjunctCadastre.find(session[:cadastre_id])
        @kins = Regularization::AdjunctCadastre.find(session[:cadastre_id]).kins
      else
        redirect_to new_consult_path
      end
    end
    
    def set_step
      @step = "kin"
    end

    def set_requeriment
      @requeriment = Regularization::Requeriment.find(params[:requeriment_id])
    end

    def set_params
      params.require(:kin).permit(:name, :rg, :rg_org, :cid, :cpf, :rg_uf, :gender, :born, :place_birth, :flag_special_condition, :special_condition_id,
                                  :income, :kinship_id, :copurchaser_flag, :percent)
    end
  end
end
