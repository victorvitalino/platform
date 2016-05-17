require_dependency 'app/helpers/application_helper'

module Attendance
  class ApplicationController < ActionController::Base
    layout 'layouts/material'

    helper ::ApplicationHelper

    include Pundit

    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  end
end
