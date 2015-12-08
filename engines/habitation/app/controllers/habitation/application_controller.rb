require_dependency 'application_helper'

module Habitation
  class ApplicationController < ActionController::Base
    layout 'material'

    helper :application

    include Pundit
  end
end
