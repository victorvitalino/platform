require_dependency "firm/application_controller"

module Firm
  class EnterpriseCadastresController < ApplicationController
    layout 'layouts/material'


    def index
       @enterprise_cadastres = Firm::EnterpriseCadastre.where(enterprise_id: params[:enterprise_id])
    end


  end
end
