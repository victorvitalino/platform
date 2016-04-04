require_dependency 'entity_portal/application_controller'

module EntityPortal
  class OldsController < ApplicationController

    has_scope :name_entity
    has_scope :code
    has_scope :cnpj

    def index
        @old = Entity::Old.order(:name).all
        @old = apply_scopes(@old).paginate(:page => params[:page], :per_page => 20)
    end

    def show
      @old = Entity::Old.find(params[:id])
      @old_candidate =Entity::OldCandidate.where(old_id: params[:id])
    end

  end
end