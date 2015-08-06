require_dependency "helpdesk/application_controller"

module Helpdesk
  class ReportAttendantsController < ApplicationController
    before_action :set_user
    def index
      
    end

    def new
    	sector = Person::Sector.find_by_prefex(100)
      @sector_users = Person::Staff.where(sector_current_id: sector.id)
      @result = Helpdesk::OrderService.where(responsible_id: @user, status: "4")
    end

    private

    def set_user
      @user = Person::Staff.find_by_id(params[:staff])
    end
  end
end
