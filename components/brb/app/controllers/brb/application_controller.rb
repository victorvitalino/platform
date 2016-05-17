require_dependency 'authenticate/staff_service'

module Brb
  class ApplicationController < ActionController::Base
    layout 'patternfly/application'

    include Pundit
    include Authenticate::StaffService
    helper  Authenticate::StaffHelper
    helper  ::NavigationHelper

    before_action :authenticate_staff?

    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  end
end
