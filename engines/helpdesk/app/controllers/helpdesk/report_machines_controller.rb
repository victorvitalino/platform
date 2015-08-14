require_dependency "helpdesk/application_controller"

module Helpdesk
  class ReportMachinesController < ApplicationController
    before_action :set_machine
    def index
      authorize :attendant, :report
    end

    def new
      authorize :attendant, :report
      @goods =  Patrimony::Good.all
      @result = Helpdesk::OrderService.where(good_id: @machine)
    end

    private

    def set_machine
      @machine = Patrimony::Good.find_by_code_goods(params[:good])
    end
  end
end
