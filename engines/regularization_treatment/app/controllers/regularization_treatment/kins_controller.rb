module RegularizationTreatment
  class KinsController < ApplicationController
    before_action :set_cadastre
    before_action :set_step

    def new
      @kin = @cadastre.kins.new
      @kin.build_kin_adjunct
    end

    def create
      @kin = @cadastre.kins.new(set_params)
      if @kin.save
        render action: 'new'
      else
        render action: 'new'
      end

    end

    private

    def set_step
      @step = "kin"
    end

    def set_cadastre
      if session[:cadastre_id].present?
        @cadastre = Candidate::Cadastre.find(session[:cadastre_id])
      else
        flash[:info] = "É necessario preencher o cadastro."
        redirect_to new_cadastre_path
      end
    end

    def set_params
      params.require(:kin).permit(:name, :rg, :rg_org, :rg_uf, :gender, :born, :place_birth, :flag_special_condition, :special_condition_id,
        kin_adjunct_attributes: [:income, :kinship_id, :copurchaser_flag, :percent, :civil_state_id])
    end
  end
end
