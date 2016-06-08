require_dependency 'shared/nav_helper'
module Action
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    layout 'shared/remark'

    include Authenticate::StaffService
    helper  Authenticate::StaffHelper
    helper  ::NavigationHelper

    before_action :authenticate_staff?

    include Pundit

    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  end
end
