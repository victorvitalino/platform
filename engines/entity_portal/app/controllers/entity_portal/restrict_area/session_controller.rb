require_dependency 'entity_portal/application_controller'
module EntityPortal
  module RestrictArea
    class SessionController < ApplicationController
      before_action :validate_session!


      def edit
      end

      def update
        if @entity.update(set_params)
          redirect_to restrict_area_cadastres_path
        else
          render action: 'edit'
        end
      end

      private

      def set_params
        params.require(:member).permit(:name, :cpf, :rg, :rg_org, :born, :telephone, :telephone_optional,
                                       :celphone, :member_job_id, :certificate_civil_criminal)
      end

      def validate_session!
        if session[:entity_auth_id].present? && session[:entity_expiration_id].present? && session[:entity_expiration_id] > Time.now
          @entity = Entity::Cadastre.find(session[:entity_auth_id])
        else
          redirect_to entity_portal.new_authorization_path
        end
      end

    end
  end
end