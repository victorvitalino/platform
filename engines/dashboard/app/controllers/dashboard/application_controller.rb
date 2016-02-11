require_dependency 'authenticate/staff_service'
require_dependency 'authenticate/staff_helper'

module Dashboard
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    layout 'remark'
    
    include Authenticate::StaffService
    helper  Authenticate::StaffHelper
    
    before_action :authenticate_staff?

    include Pundit

  end
end
