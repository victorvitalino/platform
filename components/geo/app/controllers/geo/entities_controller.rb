require_dependency 'geo/application_controller'

module Geo
  class EntitiesController < ApplicationController

    has_scope :by_name
    has_scope :by_situation
    
    def index
      
      if params[:situation] == "complete" && params[:situation].present?
        @entities    = Entity::Cadastre.complete
        @entites_old = Entity::Old.where(cnpj: @entities.map(&:cnpj)).order(:name)
      else
        @entites_old = Entity::Old.where(old: 'Credenciada').order(:name)
      end

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


    def entities_2016
      @entities    = apply_scopes(Entity::Cadastre).all
    end

  end
end
