require_dependency 'shared/application_helper'

module Entity
  class ApplicationController < ActionController::Base
    layout 'patternfly/application'

    include Authenticate::StaffService
    helper  Authenticate::StaffHelper
    helper  ::NavigationHelper

    # before_action :authenticate_staff?

    include Pundit

    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized


    before_action :allow_iframe

    private
    def allow_iframe
      response.headers.delete('X-Frame-Options')
    end
  end

end
