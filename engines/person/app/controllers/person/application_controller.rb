require_dependency 'person/application_helper'

module Person
  class ApplicationController < ActionController::Base
    layout 'remark'
    helper ::ApplicationHelper

    include Authenticate::StaffService
    helper  Authenticate::StaffHelper
    
    before_action :authenticate_staff?

    include Pundit
    
  end
end
