module Dashboard
  class ApplicationController < ActionController::Base
  	layout 'layouts/material'
		
		include Pundit  	
  end
end
