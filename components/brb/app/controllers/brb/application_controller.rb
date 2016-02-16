require_dependency 'authenticate/staff_service'

module Brb
  class ApplicationController < ActionController::Base
    layout 'shared/remark'

    include Pundit
    include Authenticate::StaffService
    helper  Authenticate::StaffHelper
    helper  Shared::NavHelper

    before_action :authenticate_staff?
  end
end
