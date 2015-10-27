require_dependency 'portal/application_helper'

module SchedulePortal
  class ApplicationController < ActionController::Base
    layout 'portal'

    helper 'portal/application'
  end
end
