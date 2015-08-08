require_dependency "helpdesk/application_controller"

module Helpdesk
  class ReportAttendantsController < ApplicationController
    before_action :set_user,only: [:new]
    def index
      
    end

    def new
      sector = Person::Sector.find_by_prefex(800)
      @sector_users = Person::Staff.where(sector_current_id: sector.id)
      result = Helpdesk::OrderService.where(responsible_id: @user)
      result.each do |a|
        if a.responsible_id.present?
          @result = Helpdesk::OrderService.where(responsible_id: @user)
        end
      end
    end

    private

    def set_user
      @user = Person::Staff.find_by_id(params[:staff])
    end
  end
end
