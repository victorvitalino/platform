module Protocol
  class ApplicationController < ActionController::Base
    layout 'layouts/material'

    include Pundit
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    helper ::ApplicationHelper

    private
    def user_not_authorized
       flash[:error] = "Você não tem permissão para acessar esta área"
        redirect_to (request.referrer || root_path)
    end
  end
end
