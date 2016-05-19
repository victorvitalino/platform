require_dependency 'protocol/application_controller'

module Protocol
    class ControlsController < ApplicationController
        before_action :set_controls, only: [:index, :create, :destroy, :update]
        before_action :set_control, only: [:edit, :destroy, :update, :show]

        def index
          authorize :control,  :index?
        end

        def new
            authorize :control,  :create?
            @control = Control.new

        end

        def create
            authorize :control,  :create?
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

        def show

        end

        def update
            authorize :control,  :update?
            @control.update(control_params)
        end

        def destroy
            authorize :control,  :destroy?
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
