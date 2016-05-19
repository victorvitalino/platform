require_dependency 'protocol/application_controller'

module Protocol
    class ControlInterestedsController < ApplicationController
      before_action :set_control
      before_action :set_control_interesteds, only: [:index, :create, :destroy, :update]
      before_action :set_control_interested, only: [:edit, :destroy, :update, :show]

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
          @control_interested.staff_id = current_user.id
          @control_interested.save
          redirect_to action: 'index'

      end

      def edit
      end

      def show
      end

      def update
          authorize :control_interested,  :update?
          @control_interested.update(control_interested_params)
          redirect_to control_control_interesteds_path(@control.id)
      end

      def destroy
          authorize :control_interested,  :destroy?
          if @control_interested.destroy
              redirect_to action: 'index'
          end
      end

      private

      def control_interested_params
          params.require(:control_interested).permit(:name, :cpf,:foundation, :address, :state_id, :city_id, :cep, :email, :telephone, :fax, :interested_type)
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
