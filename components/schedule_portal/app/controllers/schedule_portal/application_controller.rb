require_dependency 'portal/application_helper'

module SchedulePortal
  class ApplicationController < ActionController::Base
    layout 'shared/portal'

    helper 'portal/application'
    before_action :allow_iframe
    def allow_iframe
      response.headers.delete('X-Frame-Options')
    end
  end
end
