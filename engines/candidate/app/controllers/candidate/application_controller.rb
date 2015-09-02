require_dependency 'application_controller'
module Candidate
  class ApplicationController < ActionController::Base
    layout 'material'
    
    helper ::ApplicationHelper
    include Pundit
  end
end
