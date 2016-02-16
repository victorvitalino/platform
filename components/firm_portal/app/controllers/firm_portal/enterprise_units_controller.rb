require_dependency "firm_portal/application_controller"

module FirmPortal
  class EnterpriseUnitsController < ApplicationController
      before_action :validate_session!
      before_action :set_enterprises
      before_action :set_enterprise_unit, only: [:show]
      before_action :set_tab

      has_scope :address
      has_scope :status

    def index
       @enterprise_units = Address::Unit.where(firm_enterprise_id: @enterprises)
       @enterprise_units =  apply_scopes(@enterprise_units).paginate(:page => params[:page], :per_page => 20)
    end

    def new
        @enterprise_status = Firm::EnterpriseStatus.new
    end

    def show

    end

    def create
        @enterprise_status = Firm::EnterpriseStatus.new(enterprise_status_params)
        @enterprise_status.save

        redirect_to enterprise_cadastres_path
    end

    private

     def validate_session!
        if session[:firm_auth_id].present? && session[:firm_expiration_id].present? && session[:firm_expiration_id] > Time.now
          @firm = Firm::UserCompany.find(session[:firm_auth_id])
        else
          redirect_to firm_portal.new_authorization_path
        end
      end

    def enterprise_status_params
      params.require(:enterprise_status).permit(:cadastre_id,:enterprise_cadastre_id,:observation, :status_cadastre_id,:archive_file)
    end

    def set_enterprise_unit
      @enterprise_unit = Address::Unit.find(params[:id])
    end

    def set_enterprises
       @enterprises = Firm::Enterprise.where(company_id: @firm.company_id)
    end

    def set_tab
        @tab = 'enderecos'
    end

  end
end
