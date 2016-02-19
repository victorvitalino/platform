require_dependency 'person/application_controller'

module Person
  class StaffSystemsController < ApplicationController
    
    def index
      @staff = Staff.find(params[:staff_id])
      @systems = System.all.order(:code)
    end
  end
end