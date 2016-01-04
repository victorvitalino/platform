require_dependency 'application_controller'
require_dependency 'concourse/application_helper'

module Concourse
  class ApplicationController < ActionController::Base
    layout 'material'

    include Pundit

    helper :application
  end
end
