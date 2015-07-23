require_dependency "helpdesk/application_controller"

module Helpdesk
  class OrderServicesController < ApplicationController
    before_action :set_order_services, only: [:index, :destroy, :update, :create]
    before_action :set_order_service, only: [:edit, :destroy, :update]

    # GET /order_services
    def index
     authorize :order_service
    end

    # GET /order_services/1
    def show
    end

    # GET /order_services/new
    def new
      @order_service = OrderService.new
      authorize @order_service
      @order_service.monitor_service_orders.build
    end

    # GET /order_services/1/edit
    def edit
    end
    # POST /order_services
    def create
      @order_service = OrderService.new(order_service_params)
      authorize @order_service
      @order_service.sector_id = current_user.account.sector_current_id
      @order_service.opened_by_id = current_user.account.id
      @order_service.status = 0
      @order_service.save
    end

    # PATCH/PUT /order_services/1
    def update
      authorize @order_service
      @order_service.update(order_service_params)
    end

    # DELETE /order_services/1
    def destroy
      authorize @order_service
      if @order_service.destroy
        redirect_to action: 'index'
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_order_service
        @order_service = OrderService.find(params[:id])


      end

      def set_order_services
        @order_services_open = OrderService.where('status = 0')
        @order_services_reopened = OrderService.where('status = 1')
        @order_services_inprogress = OrderService.where('status = 2')
        @order_services_solved = OrderService.where('status = 3')
        @order_services_closed = OrderService.where('status = 4').limit(100)
      end

      # Only allow a trusted parameter "white list" through.
      def order_service_params
        params.require(:order_service).permit(:subject, :category, :number, :qualification, :status, :number_increment, 
                                              :opened_by_id, :responsible_id, :staff_id, 
                                              :sector_id, :branch_line_id, :good_id, 
                                               monitor_service_orders_attributes: [:appointment, :attachment])
      end
  end
end
