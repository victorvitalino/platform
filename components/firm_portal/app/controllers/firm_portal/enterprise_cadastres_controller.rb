require_dependency "firm_portal/application_controller"

module FirmPortal
  class EnterpriseCadastresController < ApplicationController
     before_action :validate_session!
     before_action :set_enterprises
     before_action :set_cadastre, only: [:enable,  :index]
     before_action :set_tab

     has_scope :by_cpf
     has_scope :name_candidate
     has_scope :status

    def index
      #if params[:cpf].present? ||  params[:name_candidate].present? || params[:status].present?
       @enterprise_cadastres = Firm::View::FirmCadastre.where(enterprise_id: @enterprises).includes(:cadastre).order(total: :desc).all
       @enterprise_cadastres = apply_scopes(@enterprise_cadastres).paginate(:page => params[:page], :per_page => 20)
    #  end
    end

    def new
        @enterprise_cadastre = Candidate::EnterpriseCadastreSituation.new
    end

   def enable
     @id = params[:enterprise_cadastre_id]
     @status_id = 10

      @enterprise_statuses = Candidate::EnterpriseCadastreSituation.new
      @enterprise_statuses.cadastre_id = params[:cadastre_id]
      @enterprise_statuses.enterprise_cadastre_id = params[:enterprise_cadastre_id]
      @enterprise_statuses.status_cadastre_id = 10
      @enterprise_statuses.save

    end

    private



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
      @enterprise = Project::Enterprise.find(params[:id])
    end

    def set_enterprises
       @enterprises = Project::Enterprise.where(company_id: @firm.company_id)
    end

    def set_tab
      @tab = 'candidatos'
    end
  end
end
