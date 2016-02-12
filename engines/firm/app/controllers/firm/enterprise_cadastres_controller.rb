require_dependency 'firm/application_controller'

module Firm
  class EnterpriseCadastresController < ApplicationController

    before_action :set_enterprise
    before_action :set_enterprise_cadastre, only: [:edit, :update]

    has_scope :cpf
    has_scope :name_candidate
    has_scope :status

    def index
       @enterprise_cadastres = Firm::EnterpriseCadastre.where(enterprise_id: params[:enterprise_id])
       @enterprise_cadastres = apply_scopes(@enterprise_cadastres).paginate(:page => params[:page], :per_page => 20)
    end

    def edit
    end

    def show
    end

      def update
         if  @enterprise_cadastre.update(set_enterprise_cadastre_params)
            flash[:success] = "Documento atualizado."
            redirect_to enterprise_enterprise_cadastres_path(enterprise_id: @enterprise_cadastre.enterprise_id)
         else
           render action: 'edit'
         end
     end

    private

    def set_enterprise_cadastre
       @enterprise_cadastre = @enterprise.enterprise_cadastres.find(params[:id])
    end

    def set_enterprise
       @enterprise = Firm::Enterprise.find(params[:enterprise_id])
    end

    def set_enterprise_cadastre_params
        params.require(:enterprise_cadastre).permit(:status, :source_list)
    end


  end
end
