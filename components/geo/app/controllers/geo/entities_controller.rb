require_dependency 'geo/application_controller'

module Geo
  class EntitiesController < ApplicationController

    def index
      
      @entites_old = Entity::Old.where(old: 'Credenciada').order(:name)

      respond_to do |format|
        format.json {
          render json: @entites_old
        }

        format.html
      end
    end

    def situation_entity
      @entity_complete     = Entity::Cadastre.complete.find_by_cnpj(params[:cnpj]) rescue nil

      render json: @entity_complete
    end

  end
end
