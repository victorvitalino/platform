require_dependency 'application_helper'

module Helpdesk
  class ApplicationController < ActionController::Base
    layout 'remark'

    helper 'application'

    include Pundit
  end
end
