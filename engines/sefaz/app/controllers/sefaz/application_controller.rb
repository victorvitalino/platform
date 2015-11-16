require_dependency 'application_controller'
require_dependency 'application_helper'

module Sefaz
  class ApplicationController < ActionController::Base
    layout 'material'
  
    helper 'application'
        
    include Pundit
  end
end
