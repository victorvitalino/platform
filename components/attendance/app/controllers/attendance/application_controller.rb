require_dependency 'authenticate/staff_service'
require_dependency 'authenticate/staff_helper'
require_dependency 'navigation_helper'

module Attendance
  class ApplicationController < ActionController::Base
    layout 'patternfly/application'
    
    include Pundit
    include Authenticate::StaffService
    helper  Authenticate::StaffHelper
    helper  ::NavigationHelper
    
    before_action :authenticate_staff?

  end
end
