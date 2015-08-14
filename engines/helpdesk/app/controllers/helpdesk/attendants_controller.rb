require_dependency "helpdesk/application_controller"

module Helpdesk
  class AttendantsController < ApplicationController
     before_action :set_attendants, only: [:new, :create, :update]
     before_action :set_attendant, only: [:edit, :destroy, :update]
    def index
       authorize @attendants
    end

    def new
      @attendant = Attendant.new
      authorize @attendant
    end

    def create
      @attendant = Attendant.new(attendant_params)
      if @attendant.save
        flash[:success] = t :success
      end
    end

    def edit
      
    end

    def update
      authorize @attendant
      if @attendant.update(attendant_params)
        flash[:success] = t :success
      end
    end

    def destroy
       authorize @attendant
      if @attendant.destroy
        redirect_to action: 'new'
        flash[:success] = t :success
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
