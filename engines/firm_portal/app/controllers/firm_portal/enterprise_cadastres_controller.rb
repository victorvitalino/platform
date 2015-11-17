require_dependency "firm_portal/application_controller"

module Firm
  class EnterpriseCadastresController < ApplicationController
    layout 'layouts/material'



    def index
          @enterprise_cadastres = EnterpriseCadastre.all
    end


    private

    def enterprise_params
      params.require(:enterprise).permit(:name,:value,:tipoly_id, :company_id,:city_id,:status)
    end

    def set_enterprise
      @enterprise = Enterprise.find(params[:id])
    end
  end
end
