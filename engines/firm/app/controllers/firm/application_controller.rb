require_dependency 'application_controller'
module Firm
  class ApplicationController < ActionController::Base
    layout 'material'
    helper ::ApplicationHelper

    include Pundit
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  end
end
