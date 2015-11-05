require_dependency 'entity_portal/application_controller'
module EntityPortal
  module RestrictArea
    class CadastresController < ApplicationController
      before_action :validate_session!
      before_action :set_tab

      def index
      end

      def edit
      end

      def update
      end

      private

      def set_params
        params.require(:cadastre).permit(:name)
      end

      def validate_session!
        if session[:entity_auth_id].present?
          @entity = Entity::Cadastre.find(session[:entity_auth_id])
        else
          redirect_to entity_portal.new_authenticate_path
        end
      end

      def set_tab
        @tab = 'geral'
      end
    end
  end
end