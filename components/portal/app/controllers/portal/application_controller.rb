require_dependency 'portal/application_helper'

module Portal
  class ApplicationController < ActionController::Base
    layout 'shared/portal'
  end
end
