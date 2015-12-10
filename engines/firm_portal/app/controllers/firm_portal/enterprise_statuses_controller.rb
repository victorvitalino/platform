require_dependency "firm_portal/application_controller"

module FirmPortal
  class EnterpriseStatusesController < ApplicationController


    def new
        @enterprise_status = Firm::EnterpriseStatus.new
    end

    def create
        @enterprise_status = Firm::EnterpriseStatus.new(enterprise_status_params)
        @enterprise_status.save

        redirect_to enterprise_cadastres_path
    end


    private

    def enterprise_status_params
      params.require(:enterprise_status).permit(:cadastre_id,:enterprise_cadastre_id,:observation, :status_cadastre_id,:archive_file,)
    end

    def set_enterprise
      @enterprise = Firm::Enterprise.find(params[:id])
    end
  end
end
