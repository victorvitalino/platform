require_dependency 'application_helper'
require_dependency 'portal/application_helper'

module ActionPortal
  class CadastresController < ApplicationController
    # GET /posts/new
    def new
      @cadastre = Action::Cadastre.new
    end


    # POST /posts
    def create
      @cadastre = Action::Cadastre.new(cadastre_params)
      if @cadastre.save
        redirect_to action: 'success'
      else
        render :new
      end
    end

    def success
    end

    private
      # Use callbacks to share common setup or constraints between actions.

      # Only allow a trusted parameter "white list" through.
      def cadastre_params
        params.require(:cadastre).permit(:name, :cpf, :profession_id, :formation_area_id, :atuation_area_id,
                                      :email, :password, :password_confirmation, :address, :nationality, :phone, :born, :city_id, :state_id)
      end
  end
end
