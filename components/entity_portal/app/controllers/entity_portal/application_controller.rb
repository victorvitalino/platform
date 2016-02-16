require_dependency 'application_helper'
module EntityPortal
  class ApplicationController < ActionController::Base
    layout 'portal'

    helper 'portal/application'
    helper 'application'
  end
end
