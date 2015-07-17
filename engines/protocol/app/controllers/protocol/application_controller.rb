module Protocol
  class ApplicationController < ActionController::Base

     include Pundit

     helper ::ApplicationHelper
  end
end
