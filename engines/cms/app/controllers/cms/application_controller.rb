require_dependency 'application_controller'

module Cms
  class ApplicationController < ApplicationController
    layout 'remark'
    helper ::ApplicationHelper

    include Pundit
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  end
end
