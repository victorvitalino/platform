require_dependency 'attendance/application_controller'

module Attendance
  class CounterAttendantsController < ApplicationController

    def new
      @attendant = CounterAttendant.new
    end

    def create
      @attendant = CounterAttendant.new(set_params)
      @attendant.attendant = current_user.account.attendant.id
      
      if @attendant.valid?
        @counter = StationAttendant.find_by_attendant_id(@attendant.attendant)
        @counter.update(station_id: @attendant.station, counter_id: @attendant.counter, status: true)
      end
    end

    def edit
      @attendant = StationAttendant.unscoped.find_by_attendant_id(params[:id])
    end

    def update
      @attendant = StationAttendant.find(params[:id])
      if @attendant.update(set_params_update)
        flash[:success] = t :success
        redirect_to edit_counter_attendant_path(@attendant.attendant_id)
      else
        render action: 'edit'
      end

    end

    private

    def set_params
      params.require(:counter_attendant).permit(:counter, :station)
    end

    def set_params_update
      params.require(:station_attendant).permit(:counter_id, :station_id, :supervisor, :status)
    end
    
  end
end