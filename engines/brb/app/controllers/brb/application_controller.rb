require_dependency 'application_helper'

module Brb
  class ApplicationController < ActionController::Base
    layout 'remark'

    helper :application

    include Pundit
  end
end
