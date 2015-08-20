require_dependency 'application_controller'

module Finance
  class ApplicationController < ActionController::Base
    layout 'material'

    include Pundit
    
    helper ::ApplicationHelper
  end
end
