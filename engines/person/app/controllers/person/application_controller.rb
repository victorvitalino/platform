require_dependency 'application_controller'
require_dependency 'person/application_helper'

module Person
  class ApplicationController < ApplicationController
    layout 'material'
    helper ::ApplicationHelper

    include Pundit
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  end
end
