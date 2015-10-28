module EntityPortal
  class ApplicationController < ActionController::Base
    layout 'portal'

    helper 'portal/application'
  end
end
