require_dependency 'person/application_helper'

module Person
  class ApplicationController < ActionController::Base
    layout 'patternfly/application'

    include Authenticate::StaffService
    helper  Authenticate::StaffHelper
    helper  ::NavigationHelper
    
    before_action :authenticate_staff?

    include Pundit
    
  end
end
