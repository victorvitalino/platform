require_dependency 'regularization/application_controller'

module Regularization
  class ApplicationController < ActionController::Base
     layout 'patternfly/application'

    include Authenticate::StaffService
    helper  Authenticate::StaffHelper
    helper  ::NavigationHelper

    before_action :authenticate_staff?

    include Pundit

    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  end
end
