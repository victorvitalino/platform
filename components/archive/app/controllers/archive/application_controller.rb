require_dependency 'authenticate/staff_service'
require_dependency 'authenticate/staff_helper'

module Archive
  class ApplicationController < ActionController::Base
    layout 'shared/remark'
    
    include Pundit
    include Authenticate::StaffService
    helper  Authenticate::StaffHelper
    helper  Shared::NavHelper
    
    before_action :authenticate_staff?

  end
end
