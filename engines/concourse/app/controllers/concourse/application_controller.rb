module Concourse
  class ApplicationController < ActionController::Base
    include Pundit
    helper ::Portal::ApplicationHelper
  end
end
