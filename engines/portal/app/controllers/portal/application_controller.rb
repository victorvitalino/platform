require_dependency 'application_helper'
require_dependency 'portal/application_helper'
module Portal
  class ApplicationController < ActionController::Base
    layout 'portal/application'
    helper ::ApplicationHelper
  end
end
