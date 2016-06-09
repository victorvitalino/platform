require_dependency 'action_portal/application_controller'
module ActionPortal
  class AuthorizationController < ApplicationController

    def new
      @authorization = ActionPortal::Authorization.new
    end

    def create
      @authorization = ActionPortal::Authorization.new(set_params)

      if @authorization.valid?
        session[:entity_auth_id] = @authorization.id
        session[:entity_expiration_id] = Time.now + 2.hours
        redirect_to restrict_area_cadastres_path
      else
        render action: 'new'
      end
    end

    def destroy
      session[:entity_auth_id] = nil
      session[:entity_expiration_id] = nil

      redirect_to entity_portal.new_authorization_path
    end

    private

    def set_params
      params.require(:authorization).permit(:cpf, :password)
    end

  end
end
