require_dependency "attendance/application_controller"

module Attendance
  class CountersController < ApplicationController
    before_action :set_station
    before_action :set_counter, only: [:show, :edit, :update, :destroy]

    # GET /counters
    def index
      @counters = @station.counters
    end

    # GET /counters/1
    def show
    end

    # GET /counters/new
    def new
      @counter =  @station.counters.new
      @counter.counter_subjects.build
    end

    # GET /counters/1/edit
    def edit
    end

    # POST /counters
    def create
      @counter =  @station.counters.new(counter_params)

      if @counter.save
        flash[:success] = t :success
        redirect_to action: 'index'
      else
        render :new
      end
    end

    # PATCH/PUT /counters/1
    def update
      if @counter.update(counter_params)
        flash[:success] = t :success
        redirect_to action: 'index'
      else
        render :edit
      end
    end

    # DELETE /counters/1
    def destroy
      if @counter.destroy
        flash[:success] = t :success
        redirect_to action: 'index'
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_counter
        @counter = @station.counters.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def counter_params
        params.require(:counter).permit(:subject_id, :number, :preference, :status, counter_subjects_attributes: [:subject_id ,:_destroy, :id])
      end

      def set_station
        @station = Station.find(params[:station_id])
      end

  end
end
