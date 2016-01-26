require_dependency 'application_controller'
require_dependency 'application_helper'
module Candidate
  class ApplicationController < ActionController::Base
    layout 'remark'

    helper 'application'
    
    include Pundit
  end
end
