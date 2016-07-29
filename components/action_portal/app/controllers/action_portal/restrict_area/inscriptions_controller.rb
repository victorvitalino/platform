require_dependency 'application_helper'
require_dependency 'portal/application_helper'

module ActionPortal
  module RestrictArea
    class InscriptionsController < ApplicationController
      # GET /posts/new
      before_action :validate_session!
      def new
        @inscription = Action::Inscription.new
        @actions_events = Action::SocialEvent.where(situation:'2',status:true)
      end

      def show
      end
      # POST /posts
      def create
        @inscription = Action::Inscription.new(inscription_params)
        if @inscription.save
          redirect_to action: 'success'
        else
          render :new, :id => 'aasdf'
        end
      end

      def success
      end

      private
        # Use callbacks to share common setup or constraints between actions.

        # Only allow a trusted parameter "white list" through.
        def inscription_params
          params.require(:inscription).permit(:name, :cpf, :profession, :formation_area, :atuation_area,
                                        :email, :password, :password_confirmation, :address, :nationality, :phone, :born, :city, :state)
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
