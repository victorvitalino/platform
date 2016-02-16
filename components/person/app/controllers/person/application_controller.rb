require_dependency 'person/application_helper'

module Person
  class ApplicationController < ActionController::Base
    layout 'shared/remark'

    include Authenticate::StaffService
    helper  Authenticate::StaffHelper
    helper  Shared::NavHelper
    
    before_action :authenticate_staff?

    include Pundit
    
  end
end
