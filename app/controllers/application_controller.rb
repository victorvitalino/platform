class ApplicationController < ActionController::Base
	raise Pundit::NotAuthorizedError, "must be logged in" unless user
    
  protect_from_forgery with: :exception
end
