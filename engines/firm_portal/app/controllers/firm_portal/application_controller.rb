module FirmPortal
  class ApplicationController < ActionController::Base
      layout 'portal'

    helper 'portal/application'
  end
end
