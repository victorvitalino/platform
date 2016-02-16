require_dependency 'concourse/application_helper'

module Concourse
  class ApplicationController < ActionController::Base
    layout 'concourse/application'
    
    include Authenticate::StaffService
    helper  Authenticate::StaffHelper
    helper  Shared::NavHelper
    
    before_action :authenticate_staff?

    include Pundit
  end
end
