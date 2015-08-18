require_dependency 'application_helper'
require_dependency 'portal/application_helper'

module ConcoursePortal
  class ApplicationController < ActionController::Base
    layout 'layouts/portal/application'

    helper ::ApplicationHelper
    helper Portal::ApplicationHelper
  end
end
