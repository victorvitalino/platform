require_dependency 'application_controller'
require_dependency 'person/application_helper'

module Dashboard
  class ApplicationController < ApplicationController
  	layout 'layouts/material'
		helper ::ApplicationHelper

  	include Pundit
  end
end
