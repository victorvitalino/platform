require_dependency 'authenticate/staff_service'
require_dependency 'authenticate/staff_helper'

module Cms
  class ApplicationController < ActionController::Base
    layout 'remark'
            
    include Pundit
    include Authenticate::StaffService
    helper  Authenticate::StaffHelper
    
    before_action :authenticate_staff?

  end
end
