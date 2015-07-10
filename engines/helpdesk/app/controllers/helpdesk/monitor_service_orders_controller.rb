require_dependency "helpdesk/application_controller"

module Helpdesk
  class MonitorServiceOrdersController < ApplicationController
    before_action :set_monitor_service_orders, only: [:index, :create, :new,:destroy, :update,:assume, :close_order_service]
    before_action :set_monitor_service_order, only: [:edit, :destroy, :update, :index,:assume, :close_order_service]
    # GET /monitor_service_orders
    def index
      authorize @monitor_service_orders
    end

    # GET /monitor_service_orders/1
    def show
    end

    # GET /monitor_service_orders/new
    def new
      @monitor_service_order = @order_service.monitor_service_orders.new
      authorize @monitor_service_order
    end

    # GET /monitor_service_orders/1/edit
    def edit

    end
    
    def get_image
      @monitor_service_order = MonitorServiceOrder.find(params[:image])
      authorize @monitor_service_order
    end

    def assume
      @order_service.update(responsible_id: current_user.account.id)
      authorize @order_service
      respond_to do |format|
        format.js { flash[:notice] = "Ordem de serviço assumido com sucesso!" }
      end
    end

    def close_order_service

      @order_service.update(status: false)
      authorize @order_service

      respond_to do |format|
        format.js { flash[:notice] = "Ordem de serviço fechado com sucesso!" }
      end
    end

    # POST /monitor_service_orders
    def create
      @monitor_service_order = @order_service.monitor_service_orders.new(monitor_service_order_params)
      authorize @monitor_service_order
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
      def set_monitor_service_orders
        @order_service = OrderService.find(params[:order_service_id])
        @monitor_service_orders = MonitorServiceOrder.where(order_service_id: params[:order_service_id]).order('id DESC')
      end

      def set_monitor_service_order
        @monitor_service_order = MonitorServiceOrder.where(order_service_id: params[:order_service_id]).last
        @order_service = OrderService.find(params[:order_service_id])
      end

     

      # Only allow a trusted parameter "white list" through.
      def monitor_service_order_params
        params.require(:monitor_service_order).permit(:appointment, :attachment, :staff_id, :status, :order_service_id)
      end
  end
end
