require_dependency 'protocol/application_controller'

module Protocol
    class ControlInterestedsController < ApplicationController
      before_action :set_control
      before_action :set_control_interesteds, only: [:index, :create, :destroy, :update]
      before_action :set_control_interested, only: [:edit, :destroy, :update]

      def index
         authorize :control_interested,  :index?
      end

      def new
          authorize :control_interested,  :create?
          @control_interested = @control.control_interesteds.new

      end

      def create
          authorize :control_interested,  :create?
          @control_interested = @control.control_interesteds.new(control_interested_params)
          @control_interested.save
          redirect_to action: 'index'

      end

      def edit
      end

      def update
          authorize :control_interested,  :update?
          @control_interested.update(control_interested_params)
      end

      def destroy
          authorize :control_interested,  :destroy?
          if @control_interested.destroy
              redirect_to action: 'index'
          end
      end

      private

      def control_interested_params
          params.require(:control_interested).permit(:responded, :bureau_route,:conduct, :link, :redistribuited, :need_answer, :finalized, :route_sector_id, :route_staff_id, :route_sector_date, :redistribuited_to)
      end

      def set_control_interesteds
         @control_interesteds = @control.control_interesteds.all
      end

      def set_control
          @control = Control.find(params[:control_id])
      end

      def set_control_interested
          @control_interested = ControlInterested.find(params[:id])
      end
    end
end
