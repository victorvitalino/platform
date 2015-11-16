require_dependency "attendance/application_controller"

module Attendance
  class StationsController < ApplicationController
    before_action :set_station, only: [:show, :edit, :update, :destroy]

    def counters
      render json: Counter.where(station_id: params[:station_id]).order(:number)
    end

    # GET /stations
    def index
      @stations = Station.all
    end

    # GET /stations/1
    def show
    end

    # GET /stations/new
    def new
      @station = Station.new
    end

    # GET /stations/1/edit
    def edit
    end

    # POST /stations
    def create
      @station = Station.new(station_params)

      if @station.save
        flash[:success] =  t :success
        redirect_to action: 'index'
      else
        render :new
      end
    end

    # PATCH/PUT /stations/1
    def update
      if @station.update(station_params)
        flash[:success] =  t :success
        redirect_to action: 'index'
      else
        render :edit
      end
    end

    # DELETE /stations/1
    def destroy
      if @station.destroy
        flash[:success] =  t :success
        redirect_to action: 'index'
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_station
        @station = Station.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def station_params
        params.require(:station).permit(:name, :city_id, :station_type,:convocation_id, :status)
      end
  end
end
