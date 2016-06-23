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

  end
end
