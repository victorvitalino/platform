require_dependency "helpdesk/application_controller"

module Helpdesk
  class OrderServiceUsersController < ApplicationController
  	before_action :set_order_services
    
    def index
     authorize :order_service_users
     @order_services
    end

    private

    def set_order_services
    	 @order_services = OrderService.where(staff_id: current_user.account_id).order('id DESC')
    end
  end
end
