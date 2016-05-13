require_dependency 'protocol/application_controller'

module Protocol
    class SolicitationsController < ApplicationController
        before_action :set_solicitations, only: [:index, :create, :destroy, :update]
        before_action :set_solicitation, only: [:edit, :destroy, :update]

        def index
          # authorize :allotment,  :index?
        end

        def new
          #  authorize :allotment,  :create?
            @solicitation = Solicitation.new

        end

        def create
            #authorize :allotment,  :create?
            @solicitation = Solicitation.new(solicitation_params)
            @assessment = Protocol::Assessment.where(document_number:@solicitation.document_number, document_type: @solicitation.document_type).first

            if @assessment.present?
              @solicitation.assessment_id = @assessment.id
              @solicitation.staff_id = current_user.id
              @solicitation.save
              redirect_to action: 'index'
            else
              redirect_to action: 'new'
            end
        end

        def edit
        end

        def update
            #authorize :allotment,  :update?
            @solicitation.update(solicitation_params)
        end

        def destroy
            #authorize :allotment,  :destroy?
            if @solicitation.destroy
                redirect_to action: 'index'
            end
        end

        private

        def solicitation_params
            params.require(:solicitation).permit(:document_number, :document_type,:order_date, :observation, :priority)
        end

        def set_solicitations

           @solicitations = Solicitation.all
        end

        def set_solicitation
            @solicitation = Solicitation.find(params[:id])
        end
    end
end
