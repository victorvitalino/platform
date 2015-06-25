class ApplicationController < ActionController::Base
	include Pundit
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

		private
		def user_not_authorized(exception)
		  redirect_to('/404')
		end
  protect_from_forgery with: :exception
  include Pundit
   

end
