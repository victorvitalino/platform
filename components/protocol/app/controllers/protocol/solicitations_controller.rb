require_dependency 'protocol/application_controller'

module Protocol
    class SolicitationsController < ApplicationController
        before_action :set_solicitations, only: [:index, :create, :destroy, :update]
        before_action :set_solicitation, only: [:edit, :destroy, :update, :show]

        def index
          authorize :solicitation,  :index?
        end

        def new
            authorize :solicitation,  :create?
            @solicitation = Solicitation.new

        end

        def create
            authorize :solicitation,  :create?
            @solicitation = Solicitation.new(solicitation_params)
            @assessment = Protocol::Assessment.where(document_number:@solicitation.document_number, document_type: @solicitation.document_type).first

            if @assessment.present?
              @solicitation.assessment_id = @assessment.id
              @solicitation.staff_id = current_user.id
              if @solicitation.save
                redirect_to action: 'index'
              else
                render :new
              end
            else
              flash[:danger] = "Documento não encontrado."
              redirect_to action: 'new'
            end
        end

        def edit
        end

        def show
          authorize :solicitation,  :index?
        end

        def validate
          @solicitation = Solicitation.find(params[:solicitation_id])
          @solicitation.update(authenticate_id: current_user.id, authenticate_date: Date.today)
          redirect_to action: 'index'
        end

        def update
            authorize :solicitation,  :update?
            if @solicitation.update(solicitation_params)
              redirect_to action: 'index'
            else
              render :edit
            end
        end

        def destroy
            authorize :solicitation,  :destroy?
            if @solicitation.destroy
                redirect_to action: 'index'
            end
        end

        private

        def solicitation_params
            params.require(:solicitation).permit(:document_number, :document_type,:order_date, :observation, :priority, :authenticate_id, :authenticate_date)
        end

        def set_solicitations
           @solicitations = Solicitation.all
        end

        def set_solicitation
            @solicitation = Solicitation.find(params[:id])
        end
    end
end
