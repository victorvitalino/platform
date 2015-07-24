module Protocol
    class AssessmentsController < ApplicationController
     layout 'layouts/material'
      before_action :set_assessment, only: [:show, :edit, :update, :destroy]
        def index
            @assessments = Assessment.all
        end

        def new
            @assessment = Assessment.new

        end
        def create
            @assessment = Assessment.new(set_assessment_params)
            @assessment.set_staff(current_user.account_id)
            if @assessment.save!
                redirect_to action: 'index'
            else
                render action: 'new'
            end
        end

        def show
           @conduct = Conduct.where(:assessment_id => params[:id] )
           @digital_documents = DigitalDocument.where(:assessment_id => params[:id] )
           @locations = Location.where(:assessment_id => params[:id] )
        end

        def edit

        end

        def update
            if @assessment.update(set_assessment_params)
                render action: 'index'
            else
                render action: 'edit'
            end
        end

        def destroy
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