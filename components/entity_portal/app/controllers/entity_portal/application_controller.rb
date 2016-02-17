module EntityPortal
  class ApplicationController < ActionController::Base
    layout 'shared/portal'

    helper 'shared/application'
    helper 'portal/application'
  end
end
