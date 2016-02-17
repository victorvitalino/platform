require_dependency 'portal/application_helper'

module RegularizationPortal
  class ApplicationController < ActionController::Base
    layout 'shared/portal'

    helper Portal::ApplicationHelper
  end
end
