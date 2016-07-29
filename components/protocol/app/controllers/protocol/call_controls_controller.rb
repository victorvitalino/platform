require_dependency 'protocol/application_controller'

module Protocol
    class CallControlsController < ApplicationController
      before_action :set_responsible
      before_action :set_assessment
      before_action :set_call_control, only: [:edit, :destroy,:update]
      before_action :set_call_controls, only:[:index, :create, :destroy, :update]


      def index
         #authorize :digital_document,  :index?
      end

      def new
          #authorize :digital_document,  :create?
          @call_control = @assessment.call_controls.new
      end

      def create
          #authorize :digital_document,  :create?
          @call_control = @assessment.call_controls.new(set_call_control_params)
          @call_control.staff_id = current_user.id
          @call_control.save
      end

      def edit

      end

      def update
        @call_control.update(set_call_control_params)
      end

      def destroy
        #authorize :digital_document,  :destroy?
        @call_control.destroy
      end

        private

        def set_responsible
          @responsible = Person::Staff.find(current_user.id)
        end
        def set_call_controls
            @call_controls = @assessment.call_controls.all
        end

        def set_call_control
            @call_control = CallControl.find(params[:id])
        end

        def set_assessment
            @assessment = Assessment.find(params[:assessment_id])
        end

        def set_call_control_params
            params.require(:call_control).permit(:time_start, :time_end,:phone_number,:interested,:observation,:assessment_id,:staff_id)
        end

    end
end
