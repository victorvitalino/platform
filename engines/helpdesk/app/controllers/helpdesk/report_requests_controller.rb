require_dependency "helpdesk/application_controller"

module Helpdesk
  class ReportRequestsController < ApplicationController
    
    def index
      
    end

     def new
      @requests = Helpdesk::OrderService.select("subject")
      @result =   Helpdesk::OrderService.where(subject: params[:subject])
      @request =  Helpdesk::OrderService.find_by_subject(params[:subject])
    end
  end
end
