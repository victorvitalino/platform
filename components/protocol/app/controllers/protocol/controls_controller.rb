require_dependency 'protocol/application_controller'

module Protocol
    class ControlsController < ApplicationController
        before_action :set_controls, only: [:index, :create, :destroy, :update]
        before_action :set_control, only: [:edit, :destroy, :update]

        def index
          # authorize :allotment,  :index?
        end

        def new
          #  authorize :allotment,  :create?
            @control = Control.new

        end

        def create
            #authorize :allotment,  :create?
            @control = Control.new(control_params)
            @assessment = Protocol::Assessment.where(document_number:@control.document_number, document_type: @control.document_type).first

            if @assessment.present?
              @control.assessment_id = @assessment.id
              @control.staff_id = current_user.id
              @control.save
              redirect_to action: 'index'
            else
              redirect_to action: 'new'
            end
            @control.save

        end

        def edit
        end

        def update
            #authorize :allotment,  :update?
            @control.update(control_params)
        end

        def destroy
            #authorize :allotment,  :destroy?
            if @control.destroy
                redirect_to action: 'index'
            end
        end

        private

        def control_params
            params.require(:control).permit(:document_number, :document_type,:input_doc_date)
        end

        def set_controls
           @controls = Control.all
        end

        def set_control
            @control = Control.find(params[:id])
        end
    end
end
