module Schedule
  class ApplicationController < ActionController::Base
    layout 'patternfly/application'

    include Authenticate::StaffService
    helper  Authenticate::StaffHelper
    helper  ::NavigationHelper

    include Pundit

    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  end
end
