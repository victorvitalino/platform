module Schedule
  class ApplicationController < ActionController::Base
    layout 'patternfly/application'

    include Authenticate::StaffService
    helper  Authenticate::StaffHelper
    helper  ::NavigationHelper

    include Pundit
  end
end
