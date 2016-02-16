require_dependency 'application_controller'
module Entity
  class ApplicationController < ActionController::Base
    layout 'remark'

    include Authenticate::StaffService
    helper  Authenticate::StaffHelper

    before_action :authenticate_staff?

    include Pundit
  end
end
