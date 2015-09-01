module RegularizationTreatment
  class CadastreProceduralStatusesController < ApplicationController
    before_action :set_step

    def new
      @cadastre_procedural_status = Candidate::CadastreProceduralStatus.new

    end

    def create
      @cadastre_procedural_status = Candidate::CadastreProceduralStatus.new(set_params)
      if @cadastre_procedural_status.save
        render new_kin_path
      else
        render action: 'new'
      end

    end

    private

    def set_step
      @step = "final"
    end

    def set_params
      params.require(:cadastre_procedural_status).permit(:adjunct_cadastre_id)
    end
  end
end
