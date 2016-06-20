require_dependency 'authenticate/staff_service'
require_dependency 'authenticate/staff_helper'
module Visit
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    layout 'patternfly/mobile-less-application'

    include Authenticate::StaffService
    helper  Authenticate::StaffHelper
    helper  ::NavigationHelper

    before_action :authenticate_staff?

    include Pundit

    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  end
end
