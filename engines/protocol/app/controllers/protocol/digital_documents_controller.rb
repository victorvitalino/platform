module Protocol
    class DigitalDocumentsController < ApplicationController
        layout 'layouts/material'
        before_action :set_assessment
        before_action :set_digital_documents, only: [:index, :new,:create, :destroy]
        before_action :set_digital_document, only: [:edit, :destroy]

        def index
           authorize @digital_documents
        end

        def new
            @digital_document = @assessment.digital_documents.new
            authorize @digital_document
        end

        def create
            @digital_document = @assessment.digital_documents.new(digital_document_params)
            @digital_document.staff_id = current_user.account_id
            authorize @digital_document
            @digital_document.save
        end

        def destroy
            authorize digital_document
            @digital_document.destroy

        end

        private

        def digital_document_params
            params.require(:digital_document).permit(:page_number, :doc_path,:assessment_id,:staff_id)
        end


        def set_assessment
            @assessment = Assessment.find(params[:assessment_id])
        end

        def set_digital_documents
            @digital_documents = DigitalDocument.where(assessment_id: params[:assessment_id])
        end

        def set_digital_document
            @digital_document = DigitalDocument.find(params[:id])
        end
    end
end
