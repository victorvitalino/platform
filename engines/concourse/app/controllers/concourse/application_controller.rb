module Concourse
  class ApplicationController < ActionController::Base
    helper ::Portal::ApplicationHelper


    include Pundit

    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    private

    def user_not_authorized(exception)
      redirect_to('/404')
    end 
  end
end
