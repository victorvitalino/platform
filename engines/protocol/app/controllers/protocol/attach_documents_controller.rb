module Protocol
    class AttachDocumentsController < ApplicationController
     layout 'layouts/material'
      before_action :set_assessment, except: [:add]
      before_action :set_attach_document, only:[:destroy,:show]
      before_action :set_attach_documents, only: [:index, :new,:add,:destroy]


        def index
            authorize :conduct,  :index?
        end

        def new
            @attach_document = @assessment.attach_documents.new
            sector = current_user.account.sector_current.id
            authorize :conduct,  :create?
            #parametro 4 documento recebido pelo setor
            @attach_result = Protocol::Conduct.find_document(params[:document],params[:document_type],4,sector)

        end

        def add_attach
            authorize :conduct,  :add?
            sector = current_user.account.sector_current.id

            @assessment= Protocol::Assessment.find(params[:id])
            @attach_document = @assessment.attach_documents.new
            @attach_document.set_attach(current_user, params[:assessment_id],0)

            if @attach_document.save
                flash[:success] = t :success
                redirect_to new_assessment_attach_document_path(@assessment)
            else
                flash[:danger] = t :error
                redirect_to action: 'new'
            end
        end


          def add_append
            authorize :conduct,  :add?
            sector = current_user.account.sector_current.id

            @assessment= Protocol::Assessment.find(params[:id])
            @attach_document = @assessment.attach_documents.new
            @attach_document.set_attach(current_user, params[:assessment_id],1)

            if @attach_document.save
                flash[:success] = t :success
                redirect_to new_assessment_attach_document_path(@assessment)
            else
                flash[:danger] = t :error
                redirect_to action: 'new'
            end
        end


        def destroy
            authorize :conduct,  :destroy?
            if @attach_document.destroy
                redirect_to action: 'new'
            end
        end

        private


        def set_attach_documents
            @attach_documents = AttachDocument.where(document_father_id: params[:assessment_id])
        end

        def set_attach_document
            @attach_document = AttachDocument.find(params[:id])
        end

        def set_assessment
            @assessment = Assessment.find(params[:assessment_id])
        end



        def set_conduct_params
                params.require(:attach_document).permit(:document_father_id, :document_child_id,:attach_type_id,:sector_id,:staff_id)
        end

    end
end