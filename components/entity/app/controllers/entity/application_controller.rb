require_dependency 'shared/application_helper'

module Entity
  class ApplicationController < ActionController::Base
    layout 'remark'

    include Authenticate::StaffService
    helper  Authenticate::StaffHelper
    helper  Shared::ApplicationHelper

    before_action :authenticate_staff?

    include Pundit


  end
end
