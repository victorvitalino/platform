module RegularizationTreatment
  class KinsController < ApplicationController
    before_action :set_step

    def new
      @kin = Candidate::Kin.new
      @kin.build_kin_adjunct
    end

    def create
      @kin = Candidate::Kin.new(set_params)
      @kin.build_kin_adjunct
      if @kin.save

      else
        render action: 'new'
      end

    end

    private

    def set_step
      @step = "kin"
    end

    def set_params
      params.require(:kin).permit(:cpf)
    end
  end
end
