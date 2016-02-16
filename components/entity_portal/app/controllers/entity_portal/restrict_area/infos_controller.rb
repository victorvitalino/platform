require_dependency 'entity_portal/application_controller'

module EntityPortal
  module RestrictArea
    class InfosController < ApplicationController
    
      def document_categories
        type = params[:type] ||= 0

        @categories = Entity::DocumentCategory.where(document_type: type)
        render json: @categories
      end

    end
  end
end