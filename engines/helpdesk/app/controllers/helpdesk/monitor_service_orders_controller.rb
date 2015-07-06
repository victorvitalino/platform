require_dependency "helpdesk/application_controller"

module Helpdesk
  class MonitorServiceOrdersController < ApplicationController
    before_action :set_monitor_service_order, only: [:index, :new, :create,  :show, :edit, :update, :destroy]

    # GET /monitor_service_orders
    def index
      
    end

    # GET /monitor_service_orders/1
    def show
    end

    # GET /monitor_service_orders/new
    def new
      @monitor_service_order = @order_service.monitor_service_orders.new
    end

    # GET /monitor_service_orders/1/edit
    def edit
    end

    # POST /monitor_service_orders
    def create
      @monitor_service_order = @order_service.monitor_service_orders.new(monitor_service_order_params)
      @monitor_service_order.staff_id = current_user.account.id
      @monitor_service_order.status = true
      @monitor_service_order.save
    end

    # PATCH/PUT /monitor_service_orders/1
    def update
      if @monitor_service_order.update(monitor_service_order_params)
        redirect_to @monitor_service_order, notice: 'Monitor service order was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /monitor_service_orders/1
    def destroy
      @monitor_service_order.destroy
      redirect_to monitor_service_orders_url, notice: 'Monitor service order was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_monitor_service_order
        @monitor_service_order = MonitorServiceOrder.find(params[:order_service_id])
        @order_service = OrderService.find(params[:order_service_id])
        @monitor_service_orders = MonitorServiceOrder.where(params[:order_service_id]).order('id DESC')
      end

      # Only allow a trusted parameter "white list" through.
      def monitor_service_order_params
        params.require(:monitor_service_order).permit(:appointment, :attachment, :staff_id, :status, :order_service_id)
      end
  end
end
