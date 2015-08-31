module RegularizationTreatment
  class KinsController < ApplicationController
    before_action :set_step
    before_action :set_kins
    def new
      @kin = Candidate::Kin.new
      @kin.build_kin_adjunct
    end

    def create
      @kin = Candidate::Kin.new(set_params)
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

    def set_kins
      @kins = Candidate::Kin.where(cadastre_id: @cadastre)
    end

    def set_params
      params.require(:kin).permit(:name, :rg, :rg_org, :rg_uf, :gender, :born, :place_birth, :flag_special_condition, :special_condition_id,
        kin_adjunct_attributes: [:income, :kinship_id, :copurchaser_flag, :percent])
    end
  end
end
