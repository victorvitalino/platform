require_dependency 'entity_portal/application_controller'
module EntityPortal
  module RestrictArea
    class DocumentationsController < ApplicationController
      before_action :validate_session!
      before_action :set_tab

      def index
        @document = Entity::Document.new
      end

      def create
        @document = Entity::Document.new(set_params)
        @document.cadastre_id = @entity.id
        if @document.save
          flash[:success] = t :success
          redirect_to action: 'index'
        else
          flash[:danger] = t :danger
          render action: 'index'
        end

      end

      def destroy
        @document = Entity::Document.find(params[:id])

        if @document.destroy
          flash[:success] = t :success
        else
          flash[:danger] = t :danger
        end

        redirect_to action: 'index'
      end

      private

      def set_params
        params.require(:document).permit(:archive_path, :observation, :document_category_id)
      end

      def validate_session!
        if session[:entity_auth_id].present? && session[:entity_expiration_id].present? && session[:entity_expiration_id] > Time.now
          @entity = Entity::Cadastre.find(session[:entity_auth_id])
        else
          redirect_to entity_portal.new_authorization_path
        end
      end

      def set_tab
        @tab = 'docs'
      end
    end
  end
end