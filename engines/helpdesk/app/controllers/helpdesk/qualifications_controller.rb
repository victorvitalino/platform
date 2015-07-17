module Helpdesk
	class QualificationsController < ApplicationController
		before_action :set_order_service
		before_action :set_order_services_user

		def edit
		end

		def update
			@order_service.update(set_params_qualification)
			@order_service.update(status: 4)
		end

		private

		def set_order_service
			@order_service = OrderService.find(params[:order_service_id])
		end

    def set_order_services_user
      @order_services = OrderService.where(staff_id: current_user.account_id).order('id DESC')
    end
		
		def set_params_qualification
			params.require(:order_service).permit(:qualification)
		end
	end
end