require_dependency 'concourse/application_helper'

module Concourse
  class ApplicationController < ActionController::Base
    layout 'concourse/application'

    include Authenticate::StaffService
    helper  Authenticate::StaffHelper
    helper  ::NavigationHelper

    before_action :authenticate_staff?

    include Pundit

    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
    
  end
end
