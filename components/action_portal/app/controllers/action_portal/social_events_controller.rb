require_dependency 'application_helper'
require_dependency 'portal/application_helper'
module ActionPortal

  class SocialEventsController < ApplicationController
    def show
      @event = Action::SocialEvent.find(params[:id])
    end
  end
end
