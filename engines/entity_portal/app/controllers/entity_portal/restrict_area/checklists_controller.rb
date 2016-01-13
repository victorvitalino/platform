require_dependency 'entity_portal/application_controller'
module EntityPortal
  module RestrictArea
    class ChecklistsController < ApplicationController
      before_action :validate_session!
      before_action :set_tab

      def index
      end

      private

      def validate_session!
        if session[:entity_auth_id].present? && session[:entity_expiration_id].present? && session[:entity_expiration_id] > Time.now
          @entity = Entity::Cadastre.find(session[:entity_auth_id])
        else
          redirect_to entity_portal.new_authorization_path
        end
      end
      
      def set_tab
        @tab = 'checklists'
      end
    end
  end
end