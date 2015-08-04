require_dependency "helpdesk/application_controller"

module Helpdesk
  class ReportRequestsController < ApplicationController
    
    def index
      
    end

     def new
      @requests = Helpdesk::OrderService.select("subject")
      @result =   Helpdesk::OrderService.where(subject: params[:subject], status: "4")
      @request =  Helpdesk::OrderService.find_by_subject(params[:subject])
      
      
      if !@result.present?
        flash[:warning] = "Não possui nenhum chamado com esse assunto!"
      end
    end
  end
end
