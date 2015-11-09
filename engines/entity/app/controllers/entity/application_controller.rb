require_dependency 'application_controller'
module Entity
  class ApplicationController < ActionController::Base
    layout 'material'

    include Pundit

    helper 'application'
  end
end
