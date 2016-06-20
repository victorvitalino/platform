require_dependency 'action_portal/application_controller'
module ActionPortal
  class RestrictAreasController < ApplicationController
    before_action :validate_session!

    def index

    end


    private


    def validate_session!
      if session[:action_auth_id].present? && session[:action_expiration_id].present? && session[:action_expiration_id] > Time.now
        @action_user = Action::Cadastre.find(session[:action_auth_id])
      else
        redirect_to action_portal.new_authorization_path
      end
    end
  end
end
