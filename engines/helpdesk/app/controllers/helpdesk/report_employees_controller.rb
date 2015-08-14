require_dependency "helpdesk/application_controller"

module Helpdesk
  class ReportEmployeesController < ApplicationController
    before_action :set_user
    def index
      authorize :attendant, :report
    end

    def new
      authorize :attendant, :report
      @users = Person::Staff.all
      result = Helpdesk::OrderService.where(staff_id: @user)
      result.each do |a|
        if a.responsible_id.present?
         @result = Helpdesk::OrderService.where(staff_id: @user)
        end
      end
    end

    private

    def set_user
      @user = Person::Staff.find_by_id(params[:staff])
    end
  end
end
