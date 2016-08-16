require_dependency 'authenticate/staff_service'
require_dependency 'authenticate/staff_helper'
module InfoCenter
  class ApplicationController < ActionController::Base
    layout 'patternfly/mobile-less-application'

    include Pundit
    include Authenticate::StaffService
    helper  Authenticate::StaffHelper
    helper  ::NavigationHelper

    before_action :authenticate_staff?

    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  end
end
