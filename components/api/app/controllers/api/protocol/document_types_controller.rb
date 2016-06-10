require_dependency 'api/application_controller'

module Api
  module Protocol
    class DocumentTypesController < ApplicationController

      def index
        @documents = ::Protocol::DocumentType.all.order(:name)
        render json: @documents
      end

      def subject_direg
        return false unless params[:id].present?
        if params[:id].to_i == 66
          @doc_type = ::Protocol::Subject.where(description: "DIREG")
        else
          @doc_type = ::Protocol::Subject.all
        end
        render json: @doc_type

      end


    end
  end
end
