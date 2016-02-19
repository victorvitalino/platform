require_dependency 'shared/application_helper'

module Entity
  class ApplicationController < ActionController::Base
    layout 'shared/remark'

    include Authenticate::StaffService
    helper  Authenticate::StaffHelper
    helper  Shared::ApplicationHelper
    helper  Shared::NavHelper

    before_action :authenticate_staff?

    include Pundit


  end
end
