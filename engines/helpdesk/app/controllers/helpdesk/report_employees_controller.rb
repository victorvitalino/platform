require_dependency "helpdesk/application_controller"

module Helpdesk
  class ReportEmployeesController < ApplicationController
    before_action :set_user
    def index
      
    end

    def new
      @users = Person::Staff.all
      @result = Helpdesk::OrderService.where(staff_id: @user, status: "4")

      
      
      if !@result.present?
        flash[:warning] = "Usuário não possui neunhum atendimento!"
      end
    end

    private

    def set_user
      @user = Person::Staff.find_by_id(params[:staff])
    end
  end
end
