module Protocol
    class AssessmentsController < ApplicationController
     layout 'layouts/material'
      before_action :set_assessment, only: [:show, :edit, :update, :destroy]
        def index
            @assessments = Assessment.all
            authorize @assessments
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