require_dependency "attendance/application_controller"

module Attendance
  class StationAttendantsController < ApplicationController
    before_action :set_station
    before_action :set_station_attendant, only: [:show, :edit, :update, :destroy]
    # GET /station_attendants
    def index
      @station_attendants = @station.attendants
    end

    # GET /station_attendants/1
    def show
    end

    # GET /station_attendants/new
    def new
      @station_attendant = @station.attendants.new
    end

    # GET /station_attendants/1/edit
    def edit
    end

    # POST /station_attendants
    def create
      @station_attendant = @station.attendants.new(station_attendant_params)

      if @station_attendant.save
        flash[:success] = t :success
        redirect_to action: 'index'
      else
        render :new
      end
    end

    # PATCH/PUT /station_attendants/1
    def update
      if @station_attendant.update(station_attendant_params)
        flash[:success] = t :success
        redirect_to action: 'index'
      else
        render :edit
      end
    end

    # DELETE /station_attendants/1
    def destroy
      @station_attendant.destroy
      redirect_to station_attendants_url, notice: 'Station attendant was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
    def set_station_attendant
      @station_attendant = StationAttendant.find(params[:id])
    end

    def set_station
      @station = Station.find(params[:station_id])
    end
    
    # Only allow a trusted parameter "white list" through.
    def station_attendant_params
      params.require(:station_attendant).permit(:attendant_id, :status, :counter_id, :supervisor, :counter)
    end

  end
end
