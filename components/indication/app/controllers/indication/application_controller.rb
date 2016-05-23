module Indication
  class ApplicationController < ActionController::Base
    layout 'patternfly/application'
    
    include Authenticate::StaffService
    helper  Authenticate::StaffHelper
    helper  ::NavigationHelper
   
    before_action :authenticate_staff?

  end
end
