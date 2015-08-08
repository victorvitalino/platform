require_dependency 'engines/portal/app/helpers/portal/application_helper'

module Regularization
  class ApplicationController < ActionController::Base
    layout 'layouts/portal/application'
    
    helper ::ApplicationHelper
    helper Portal::ApplicationHelper
  end
end
