module Helpdesk
	class QualificationsController < ApplicationController
		before_action :set_order_service

		def edit
		end

		def update
			 @order_service.update(set_params_qualification)
		end

		private

		def set_order_service
			@order_service = OrderService.find(params[:order_service_id])
		end

		def set_params_qualification
			params.require(:order_service).permit(:qualification)
		end
	end
end