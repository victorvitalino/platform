require_dependency 'application_controller'

module Finance
  class ApplicationController < ActionController::Base
    layout 'material'

    include Pundit

    helper ::ApplicationHelper

    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  end
end
