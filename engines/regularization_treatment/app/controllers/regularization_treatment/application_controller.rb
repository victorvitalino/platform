require_dependency 'regularization_treatment/application_controller'

module RegularizationTreatment
  class ApplicationController < ActionController::Base
    layout 'layouts/material'

    include Pundit
    
    helper ::ApplicationHelper
  end
end
