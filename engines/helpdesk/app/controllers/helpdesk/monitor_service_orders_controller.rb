require_dependency "helpdesk/application_controller"

module Helpdesk
  class MonitorServiceOrdersController < ApplicationController
    before_action :set_monitor_service_order, only: [:show, :edit, :update, :destroy]

    # GET /monitor_service_orders
    def index
      @monitor_service_orders = MonitorServiceOrder.where(order_service_id: params[:order_service_id])
    end

    # GET /monitor_service_orders/1
    def show
    end

    # GET /monitor_service_orders/new
    def new
      @monitor_service_order = MonitorServiceOrder.new
    end

    # GET /monitor_service_orders/1/edit
    def edit
    end

    # POST /monitor_service_orders
    def create
      @monitor_service_order = MonitorServiceOrder.new(monitor_service_order_params)

      if @monitor_service_order.save
        redirect_to @monitor_service_order, notice: 'Monitor service order was successfully created.'
      else
        render :new
      end
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
        @monitor_service_order = MonitorServiceOrder.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def monitor_service_order_params
        params.require(:monitor_service_orders).permit(:appointment, :attachment, :user, :status, :order_service_id)
      end
  end
end
