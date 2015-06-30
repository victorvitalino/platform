require_dependency "helpdesk/application_controller"

module Helpdesk
  class OrderServicesController < ApplicationController
    before_action :set_order_services, only: [:index, :create, :destroy, :update]
    before_action :set_order_service, only: [:edit, :destroy, :update]

  
    def index
      
    end

   
    def new
      @order_service = OrderService.new
      @monitor_service_order = @order_service.monitor_service_orders.build
      
    end

    
    def edit
    end

    
    def create
      @order_service = OrderService.new(order_service_params)
      @monitor_service_order = @order_service.monitor_service_orders.build
      @order_service.save
    end

   
    def update
      @order_service.update(order_service_params)
    end

    # DELETE /order_services/1
    def destroy
      if @order_service.destroy
        redirect_to action: 'index'
      end
    end

    private


      def set_order_services
        @order_services = OrderService.all
      end
      # Use callbacks to share common setup or constraints between actions.
      def set_order_service
        @order_service = OrderService.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def order_service_params
        params.require(:order_service).permit(:opened_by, :required_by, :sector_id, :branch_line_id, :user_id, :good_id, :status_id)
      end
  end
end
