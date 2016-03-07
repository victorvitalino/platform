require_dependency 'regularization/application_controller'

module Regularization
  class ApplicationController < ActionController::Base
     layout 'shared/remark'

    include Authenticate::StaffService
    helper  Authenticate::StaffHelper
    helper  Shared::NavHelper

    before_action :authenticate_staff?

    include Pundit
  end
end
