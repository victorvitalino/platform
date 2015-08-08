require_dependency "helpdesk/application_controller"

module Helpdesk
  class ReportSectorsController < ApplicationController
    before_action :set_sector
    def index
      
    end

    def new
      @sector_all = Person::Sector.where(status: true)
      result = Helpdesk::OrderService.where(sector_id: @sector)
      @result = Helpdesk::OrderService.where(sector_id: @sector)
    end


    private

    def set_sector
      @sector = Person::Sector.find_by_id(params[:sector])
    end
  end
end
