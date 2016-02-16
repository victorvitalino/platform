require_dependency 'regularization/application_controller'

module Regularization
  class ApplicationController < ActionController::Base
    layout 'material'
    include Pundit

    helper :application
  end
end
