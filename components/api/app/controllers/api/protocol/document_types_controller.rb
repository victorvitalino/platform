require_dependency 'api/application_controller'

module Api
  module Protocol
    class DocumentTypesController < ApplicationController
    
      def index
        @documents = ::Protocol::DocumentType.all.order(:name)
        render json: @documents
      end
      
    end
  end
end