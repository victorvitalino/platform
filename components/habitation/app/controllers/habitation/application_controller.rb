require_dependency 'application_helper'

module Habitation
  class ApplicationController < ActionController::Base
    layout 'shared/remark'

    include Pundit
    include Authenticate::StaffService
    helper  Authenticate::StaffHelper
    helper  Shared::NavHelper

    before_action :authenticate_staff?
    
  end
end
