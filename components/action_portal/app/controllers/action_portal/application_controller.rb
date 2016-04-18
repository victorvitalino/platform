require_dependency 'application_helper'
require_dependency 'portal/application_helper'
module ActionPortal
  class ApplicationController < ActionController::Base

    helper ::ApplicationHelper
    helper Portal::ApplicationHelper
  end
end
