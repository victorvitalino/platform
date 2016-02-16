require_dependency 'firm_portal/application_controller'
module FirmPortal
  class AuthorizationController < ApplicationController

    def new
      @authorization = FirmPortal::Authorization.new
    end

    def create
      @authorization = FirmPortal::Authorization.new(set_params)

      if @authorization.valid?
        session[:firm_auth_id] = @authorization.id
        session[:firm_expiration_id] = Time.now + 2.hours
        redirect_to enterprise_cadastres_path
      else
        render action: 'new'
      end
    end

    def destroy
      session[:firm_auth_id] = nil
      session[:firm_expiration_id] = nil

      redirect_to firm_portal.new_authorization_path
    end

    private

    def set_params
      params.require(:authorization).permit(:login_user, :password)
    end

  end
end