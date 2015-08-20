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
      @order_service.deadline = Date.today
      @order_service.save

      flash[:success] = "Chamado aberto com sucesso. Aguarde retorno da área técnica!"

    end

    # PATCH/PUT /order_services/1
    def update
      authorize @order_service
      if @order_service.update(order_service_params)
        @order_service.update(status: 5)
        redirect_to params[:redirect_to] ||  order_service_monitor_service_orders_path(@order_service.id)
      end
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
        @attendant = Attendant.find_by_staff_id(current_user.account.id)
        if @attendant.present?
         if @attendant.type_attendant == 'system'
           @order_services_open = OrderService.where(status:  0, category: 1)
           @order_services_reopened = OrderService.where(status:  1, category: 1)
           @order_services_inprogress = OrderService.where(status:  2, category: 1)
           @order_services_solved = OrderService.where(status:  3, category: 1)
           @order_services_closed = OrderService.where(status:  4, category: 1).limit(100)
           @order_services_analysis = OrderService.where(status:  5, category: 1)
         else
           @order_services_open = OrderService.where(status:  0, category: 0)
           @order_services_reopened = OrderService.where(status:  1, category: 0)
           @order_services_inprogress = OrderService.where(status:  2, category: 0)
           @order_services_solved = OrderService.where(status:  3, category: 0)
           @order_services_closed = OrderService.where(status:  4, category: 0).limit(100)
           @order_services_analysis = OrderService.where(status:  5, category: 0)
         end
        end
      end

      # Only allow a trusted parameter "white list" through.
      def order_service_params
        params.require(:order_service).permit(:deadline,  :subject, :category, :number, :qualification, :status, :number_increment,
                                              :opened_by_id, :responsible_id, :staff_id,
                                              :sector_id, :branch_line_id, :good_id,
                                               monitor_service_orders_attributes: [:appointment, :attachment])
      end
  end
end
