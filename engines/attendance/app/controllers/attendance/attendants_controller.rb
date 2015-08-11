require_dependency "attendance/application_controller"

module Attendance
  class AttendantsController < ApplicationController
    before_action :set_attendant, only: [:show, :edit, :update, :destroy]
    before_action :set_attendants
    # GET /attendants
    def index
    end

    # GET /attendants/1
    def show
    end

    # GET /attendants/new
    def new
      @attendant = Attendant.new
    end

    # GET /attendants/1/edit
    def edit
    end

    # POST /attendants
    def create
      @attendant = Attendant.new(attendant_params)
      flash[:success] = t :success if @attendant.save
    end

    # PATCH/PUT /attendants/1
    def update
      flash[:success] = t :success if @attendant.update(attendant_params)
    end

    # DELETE /attendants/1
    def destroy
      if @attendant.destroy
        flash[:success] = t :success 
        redirect_to action: 'index'
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_attendant
        @attendant = Attendant.find(params[:id])
      end

      def set_attendants
        @attendants = Attendant.all
      end

      # Only allow a trusted parameter "white list" through.
      def attendant_params
        params.require(:attendant).permit(:staff_id, :status, :description)
      end
  end
end
