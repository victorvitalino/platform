module Protocol
    class AssessmentsController < ApplicationController
     layout 'layouts/material'
      before_action :set_assessment, only: [:show, :edit, :update, :destroy]

        def index
            #TA ERRADO
            #@assessments = Conduct.find_sector(current_user.account.sector_current.id, 4).asse
            if current_user.account.sector_current.present?
                @assessments = Assessment.where(sector_id: current_user.account.sector_current.id)
            else
                @assessments = nil
            end
            authorize :assessment,  :index?
        end

        def new
           @assessment = Assessment.new
             authorize @assessment
        end
        def create
            authorize @assessment
            @assessment = Assessment.new(set_assessment_params)
            @assessment.set_staff(current_user.account_id)

            if @assessment.save!
                redirect_to action: 'index'
            else
                render action: 'new'
            end
        end


        def show
           @conduct = @assessment.conducts.all
           @digital_docs= @assessment.digital_documents.all
           @locations = @assessment.locations.all
           @attach_document = @assessment.attach_documents.all
        end

        def edit

        end

        def update
            authorize @assessment
            if @assessment.update(set_assessment_params)
                render action: 'index'
            else
                render action: 'edit'
            end
        end

        def destroy
            authorize @assessment
            @assessment.destroy
            redirect_to action: 'index'
        end

        private

         def set_assessment
            @assessment = Assessment.find(params[:id])
         end


        def set_assessment_params
                params.require(:assessment).permit(:document_number, :document_type_id, :subject_id,:description_subject,:requesting_unit,:external_agency,:recipient,:address,:cpf,:cnpj ,:sign_by ,:observation,:staff_id,:sector_id)
        end



    end
end