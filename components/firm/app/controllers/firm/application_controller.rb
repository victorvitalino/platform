require_dependency 'application_helper'

module Firm
  class ApplicationController < ActionController::Base
   layout 'patternfly/application'

    include Authenticate::StaffService
    helper  Authenticate::StaffHelper

    before_action :authenticate_staff?

    include Pundit

  end
end
