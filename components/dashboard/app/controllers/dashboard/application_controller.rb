require_dependency 'authenticate/staff_service'
require_dependency 'authenticate/staff_helper'
require_dependency 'navigation_helper'

module Dashboard
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    layout 'patternfly/application'
    
    include Authenticate::StaffService
    helper  Authenticate::StaffHelper
    helper  ::NavigationHelper

    before_action :authenticate_staff?

    include Pundit

  end
end
