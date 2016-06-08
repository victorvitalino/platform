require_dependency "firm_portal/application_controller"

module FirmPortal
  class EnterpriseCadastreSituationsController < ApplicationController


    def new
        @enterprise_situation = Candidate::EnterpriseCadastreSituation.new
    end

    def create
        @enterprise_situation = Candidate::EnterpriseCadastreSituation.new(enterprise_status_params)
        @enterprise_situation.save

        redirect_to enterprise_cadastres_path
    end


    private

    def enterprise_status_params
      params.require(:enterprise_cadastre_situation).permit(:enterprise_cadastre_id,:observation,:enterprise_cadastre_status_id,:file_path)
    end

    def set_enterprise
      @enterprise = Project::Enterprise.find(params[:id])
    end
  end
end
