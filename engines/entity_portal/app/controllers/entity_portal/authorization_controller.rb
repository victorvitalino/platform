require_dependency 'entity/application_controller'
module EntityPortal
  class AuthorizationController < ApplicationController
    
    def new
      @authorization = EntityPortal::Authorization.new
    end

    def create
      @authorization = EntityPortal::Authorization.new(set_params)
      
      if @authorization.valid?
        session[:entity_auth_id] = @authorization.id
        redirect_to restrict_area_cadastres_path
      else
        render action: 'new'
      end
    end

    private

    def set_params
      params.require(:authorization).permit(:cnpj, :password)
    end

  end
end