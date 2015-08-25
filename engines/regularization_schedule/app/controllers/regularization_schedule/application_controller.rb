require_dependency "portal/application_helper"

module RegularizationSchedule
  class ApplicationController < ActionController::Base

    include Pundit

    helper ::Portal::ApplicationHelper

  end
end
