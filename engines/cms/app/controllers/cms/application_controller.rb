require_dependency 'application_controller'

module Cms
  class ApplicationController < ActionController::Base
    layout 'layouts/material'

    include Pundit
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    helper ::ApplicationHelper

  #  before_action :redirect_first_access

    private

    def user_not_authorized(exception)
      redirect_to('/404')
    end

    def redirect_first_access
      if current_user.sign_in_count == 1 && !devise_controller?
        flash[:info] = "Você precisa alterar sua senha para seguir com o acesso normalmente."
        redirect_to main_app.edit_user_registration_path
      end
    end
  end
end
