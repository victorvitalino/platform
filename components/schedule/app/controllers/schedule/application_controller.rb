module Schedule
  class ApplicationController < ActionController::Base
    layout 'shared/remark'

    include Authenticate::StaffService
    helper  Authenticate::StaffHelper
    helper  Shared::NavHelper

    include Pundit
  end
end
