require_dependency 'application_controller'

module Concourse
  class ApplicationController < ActionController::Base
    layout 'material'

    include Pundit
  end
end
