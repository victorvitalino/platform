module Intranet
  class ApplicationController < ActionController::Base
  	layout 'layouts/material'
    helper ::ApplicationHelper
    include Pundit
  end
end
