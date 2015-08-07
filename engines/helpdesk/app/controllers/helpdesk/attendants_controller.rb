require_dependency "helpdesk/application_controller"

module Helpdesk
  class AttendantsController < ApplicationController
     before_action :set_attendants, only: [:new, :create, :update]
     before_action :set_attendant, only: [:edit, :destroy, :update]
    def index

    end

    def new
      @attendant = Attendant.new
    end

    def create
      @attendant = Attendant.new(attendant_params)
      @attendant.save
    end

    def edit
      
    end

    def update
      @attendant.update(attendant_params)
    end

    def destroy
      if @attendant.destroy
        redirect_to action: 'new'
      end 
    end
    private

    def set_attendants
      @attendants = Attendant.all
    end

    def set_attendant
      @attendant = Attendant.find(params[:id])
    end

    def attendant_params
        params.require(:attendant).permit(:staff_id, :type_attendant)
    end
  end
end
