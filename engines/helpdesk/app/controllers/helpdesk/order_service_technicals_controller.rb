require_dependency "helpdesk/application_controller"

module Helpdesk
  class OrderServiceTechnicalsController < ApplicationController
    before_action :set_order_services
    
    def index
     authorize :order_service_technicals 
     @order_services
    end

    private

    def set_order_services
      @order_services_open = OrderService.where(responsible_id: current_user.account_id, status: 0).order('id DESC')
      @order_services_reopened = OrderService.where(responsible_id: current_user.account_id, status: 1).order('id DESC')
      @order_services_inprogress = OrderService.where(responsible_id: current_user.account_id, status: 2).order('id DESC')
      @order_services_solved = OrderService.where(responsible_id: current_user.account_id, status: 3).order('id DESC')
      @order_services_closed = OrderService.where(responsible_id: current_user.account_id, status: 4).order('id DESC').limit(100)
      @order_services_analysis = OrderService.where(responsible_id: current_user.account_id, status: 5).order('id DESC')
    end
  end
end
