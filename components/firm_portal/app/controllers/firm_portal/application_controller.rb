module FirmPortal
  class ApplicationController < ActionController::Base
    layout 'shared/portal'

    helper 'portal/application'
  end
end
