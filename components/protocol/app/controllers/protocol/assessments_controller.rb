require_dependency 'protocol/application_controller'

module Protocol
  class AssessmentsController < ApplicationController
    before_action :set_assessment, only: [:show, :edit, :update, :destroy]

    has_scope :cpf
    has_scope :doc_type
    has_scope :process


    def index
        #TA ERRADO
        #@assessments = Conduct.find_sector(current_user.account.sector_current.id, 4).asse
        if current_user.account.sector_current.present?
            @assessments = Assessment.where(sector_id: current_user.account.sector_current.id)
            @assessments = apply_scopes(@assessments).paginate(:page => params[:page], :per_page => 20)
        else
            @assessments = nil
        end
        authorize :assessment,  :index?
    end

    def  daily_summary
       @assessments = Assessment.where(created_at: (date.beginning_of_day..date.end_of_day))
    end

    def new
       @assessment = Assessment.new
         authorize :assessment,  :create?
    end
    def create
        authorize :assessment,  :create?
        if current_user.account.sector_current.present?
          @assessment = Assessment.new(set_assessment_params)
          @assessment.set_staff(current_user.account_id)

          if @assessment.save!
              redirect_to action: 'index'
          else
              render action: 'new'
          end
        else
          flash[:danger] = "Usuário não está alocado em um setor."
          redirect_to action: 'index'
        end

    end


    def show
       authorize :assessment,  :index?
       @conduct = @assessment.conducts.all
       @digital_docs= @assessment.digital_documents.all
       @locations = @assessment.locations.all
       @attach_document = @assessment.attach_documents.all
    end

    def edit

    end

    def update
        authorize :assessment,  :update?
        if @assessment.update(set_assessment_params)
            flash[:success] = "Documento atualizado."
            redirect_to assessments_path
        else
            render action: 'edit'
        end
    end

    def destroy
        authorize :assessment,  :destroy?
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