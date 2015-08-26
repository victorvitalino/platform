require_dependency "attendance/application_controller"

module Attendance
  class CountersController < ApplicationController
    before_action :set_counter, only: [:show, :edit, :update, :destroy]
    before_action :set_station

    # GET /counters
    def index
      @counters = Counter.all
    end

    # GET /counters/1
    def show
    end

    # GET /counters/new
    def new
      @counter = Counter.new
    end

    # GET /counters/1/edit
    def edit
    end

    # POST /counters
    def create
      @counter = Counter.new(counter_params)

      if @counter.save
        redirect_to @counter, notice: 'Counter was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /counters/1
    def update
      if @counter.update(counter_params)
        redirect_to @counter, notice: 'Counter was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /counters/1
    def destroy
      @counter.destroy
      redirect_to counters_url, notice: 'Counter was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_counter
        @counter = Counter.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def counter_params
        params[:counter]
      end

      def set_station
        @station = Station.find(params[:station_id])
      end

  end
end
