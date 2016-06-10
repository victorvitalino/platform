require_dependency 'protocol/application_controller'

module Protocol
  class AssessmentsController < ApplicationController


    before_action :set_assessment, only: [:show, :edit, :update, :destroy]

    has_scope :cpf
    has_scope :doc_type
    has_scope :process
    has_scope :subject
    has_scope :sector


    def index

        if current_user.sector_current.present?
            unless params[:cpf].present? || params[:doc_type].present? || params[:process].present? || params[:sector].present? || params[:subject].present?
              if current_user.sector_current.prefex == "110"
                arr = [2,3]
              else
                arr = current_user.sector_current.id
              end
                @assessments = Assessment.where(sector_id: arr).order(created_at: :desc)
                @assessments = @assessments.paginate(:page => params[:page], :per_page => 20)

            else
              @assessments = Assessment.all.order(created_at: :desc)
              @assessments = apply_scopes(@assessments).paginate(:page => params[:page], :per_page => 20)
            end
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
        if current_user.sector_current.present?
          @assessment = Assessment.new(set_assessment_params)
          @assessment.set_staff(current_user.id)

          if @assessment.save
              redirect_to action: 'index'
          else
              render :new
          end
        else
          flash[:danger] = "Usuário não está alocado em um setor."
          redirect_to action: 'index'
        end

    end


    def show
       authorize :assessment,  :index?
       @conduct = @assessment.conducts.all.order(created_at: :desc)
       @digital_docs= @assessment.digital_documents.all
       @locations = @assessment.locations.all
       @attach_document = @assessment.attach_documents.all
    end

    def show_print

        @assessment = Assessment.find(params[:assessment_id])
        render layout: "shared/empty"
    end

    def edit

    end

    def update
        authorize :assessment,  :update?
        if @assessment.update(set_assessment_params)
            flash[:success] = "Documento atualizado."
            redirect_to assessments_path
        else
            render :edit
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
      params.require(:assessment).permit(:document_number, :document_type_id, :subject_id,:description_subject,:requesting_unit,:external_agency,:recipient,:address,:cpf,:cnpj ,:sign_by ,:observation,:staff_id,:sector_id,:city,:finalized,:finalized_date,:responded, :responded_date)
    end

  end
end
