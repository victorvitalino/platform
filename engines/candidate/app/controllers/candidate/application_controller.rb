require_dependency 'application_helper'

module Candidate
  class ApplicationController < ActionController::Base
    layout 'remark'
        
    include Authenticate::StaffService
    helper  Authenticate::StaffHelper
    
    before_action :authenticate_staff?
    
    include Pundit
  end
end
