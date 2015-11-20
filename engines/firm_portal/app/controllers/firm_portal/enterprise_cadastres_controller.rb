require_dependency "firm_portal/application_controller"

module FirmPortal
  class EnterpriseCadastresController < ApplicationController
     before_action :validate_session!
     before_action :set_enterprises
     before_action :set_cadastre, only: [:enable,  :index]
     before_action :set_tab


    def index
          @enterprise_cadastres = Firm::View::FirmCadastres.where(enterprise_id: @enterprises).includes(:cadastre).order(total: :desc).all
    end

    def new
        @enterprise_cadastre = Firm::EnterpriseStatus.new
    end

   def enable
     @id = params[:enterprise_cadastre_id]
     @status_id = 10

      @enterprise_statuses = Firm::EnterpriseStatus.new
      @enterprise_statuses.cadastre_id = params[:cadastre_id]
      @enterprise_statuses.enterprise_cadastre_id = params[:enterprise_cadastre_id]
      @enterprise_statuses.status_cadastre_id = 10
      @enterprise_statuses.save

    end

    private

    def enterprise_params
      params.require(:enterprise).permit(:name,:value,:tipoly_id, :company_id,:city_id,:status)
    end

     def validate_session!
        if session[:firm_auth_id].present? && session[:firm_expiration_id].present? && session[:firm_expiration_id] > Time.now
          @firm = Firm::UserCompany.find(session[:firm_auth_id])
        else
          redirect_to firm_portal.new_authorization_path
        end
      end

     def set_cadastre
      @cadastre = Candidate::Cadastre.find(params[:cadastre_id]) rescue nil
    end


    def set_enterprise
      @enterprise = Firm::Enterprise.find(params[:id])
    end

    def set_enterprises
       @enterprises = Firm::Enterprise.where(company_id: @firm.company_id)
    end

    def set_tab
      @tab = 'candidatos'
    end
  end
end
