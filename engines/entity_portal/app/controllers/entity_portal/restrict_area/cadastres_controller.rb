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
        params[:cadastre].delete :password
        params[:cadastre].delete :password_confirmation
        params[:cadastre].delete :cnpj
        params[:cadastre].delete :email

        if @entity.update(set_update_params)
          flash[:success] =  t :success
          redirect_to action: 'index'
        else
          flash[:danger] = t :danger
          render action: 'edit'
        end
      end

      private

      def set_params
        params.require(:cadastre).permit(:name)
      end

      def validate_session!
        if session[:entity_auth_id].present? && session[:entity_expiration_id].present? && session[:entity_expiration_id] > Time.now
          @entity = Entity::Cadastre.find(session[:entity_auth_id])
        else
          redirect_to entity_portal.new_authorization_path
        end
      end

      def set_update_params
        params.require(:cadastre).permit(:cnpj, :name, :fantasy_name, :telephone, :telephone_optional,
                                       :celphone, :city_id, :cep, :address, :complement, :number, :email)
      end
      
      def set_tab
        @tab = 'geral'
      end
    end
  end
end