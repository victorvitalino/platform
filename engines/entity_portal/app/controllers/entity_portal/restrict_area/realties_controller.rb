require_dependency 'entity_portal/application_controller'
module EntityPortal
  module RestrictArea
    class RealtiesController < ApplicationController
      before_action :set_tab
      before_action :set_entity

      def index
        @realties = @entity.realties
        @realty   = Entity::Realty.new
      end

      def new
        @realty = Entity::Realty.new
      end

      def create
        @realty = Entity::Realty.new(set_params)
        @realty.cadastre_id = @entity.id

        if @realty.save
          redirect_to action: 'index'
        else
          render action: 'index'
        end
        
      end

      def destroy
        @realty = @entity.realties.find(params[:id])

        if @realty.destroy 
          redirect_to action: 'index'
        end
      end

      private

     
      def set_params
        params.require(:realty).permit(:address, :city_id, :cep, :complement, :number, :burgh, :observation, :situation)
      end

      def set_entity
        if session[:entity_auth_id].present? && session[:entity_expiration_id].present? && session[:entity_expiration_id] > Time.now
          @entity = Entity::Cadastre.find(session[:entity_auth_id])

        else
          redirect_to entity_portal.new_authorization_path
        end
      end

      def set_tab
        @tab = 'realties'
      end
    end
  end
end