module Protocol
    class DocumentTypesController < ApplicationController
        layout 'layouts/material'
        before_action :set_document_types, only: [:index, :create, :destroy, :update]
        before_action :set_document_type, only: [:edit, :destroy, :update]

        def index
           authorize @document_type
        end

        def new
            @document_type = DocumentType.new
            authorize @document_type
        end

        def create
            @document_type = DocumentType.new(document_type_params)
            authorize @document_type
            @document_type.save
        end

        def edit
        end

        def update
            authorize @document_type
            @document_type.update(document_type_params)
        end

        def destroy
            authorize @document_type
            if @document_type.destroy
                redirect_to action: 'index'
            end
        end

        private

        def document_type_params
            params.require(:document_type).permit(:name, :description,:status,:prefex)
        end

        def set_document_types
            @document_types = DocumentType.all
        end

        def set_document_type
            @document_type = DocumentType.find(params[:id])
        end
    end
end
