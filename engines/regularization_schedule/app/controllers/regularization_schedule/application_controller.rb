require_dependency "portal/application_helper"

module RegularizationSchedule
  class ApplicationController < ActionController::Base
    layout 'layouts/portal/application'
    include Pundit

    helper ::Portal::ApplicationHelper

  end
end
