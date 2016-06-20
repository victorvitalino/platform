require_dependency 'application_helper'
require_dependency 'portal/application_helper'

module ActionPortal
  module RestrictArea
    class UserSocialEventsController < ApplicationController
      before_action :set_event
      before_action :set_user
      before_action :set_social_events
      before_action :validate_session!

      def mark
        @inscription = @user.inscriptions.new
        @inscription.social_event_id = @event.id
        @inscription.save
      end

      def unmark
        @inscription = @user.inscriptions.where(social_event_id: @event.id).first
        @inscription.destroy
      end

      private

      def set_event
        @event = Action::SocialEvent.find(params[:user_social_event_id])
      end

      def set_social_events
        @actions_events =  Action::SocialEvent.where(situation:'2',status:true)
      end

      def set_user
        @user  = Action::Cadastre.find(session[:action_auth_id]) rescue nil
      end

      def validate_session!
        if session[:action_auth_id].present? && session[:action_expiration_id].present? && session[:action_expiration_id] > Time.now
          @action_user = Action::Cadastre.find(session[:action_auth_id])
        else
          redirect_to action_portal.new_authorization_path
        end
      end
    end
  end
end
