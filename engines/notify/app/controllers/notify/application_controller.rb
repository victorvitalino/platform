module Notify
  class ApplicationController < ActionController::Base
     helper Notify::ApplicationHelper

     helper ::ApplicationHelper
  end
end
