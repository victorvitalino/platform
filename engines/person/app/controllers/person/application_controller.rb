module Person
  class ApplicationController < ActionController::Base
    layout 'material'

    helper ::ApplicationHelper

    include Pundit

    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    private

		def user_not_authorized(exception)
		  redirect_to('/404')
		end

  end
end
