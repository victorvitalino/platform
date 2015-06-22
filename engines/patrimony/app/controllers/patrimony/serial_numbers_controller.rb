require_dependency "patrimony/application_controller"

module Patrimony
  class SerialNumbersController < ApplicationController
    before_action :set_serial_number, only: [:show, :edit, :update, :destroy]

    # GET /serial_numbers
    def index
      @serial_numbers = SerialNumber.all
    end

    # GET /serial_numbers/1
    def show
    end

    # GET /serial_numbers/new
    def new
      @serial_number = SerialNumber.new
    end

    # GET /serial_numbers/1/edit
    def edit
    end

    # POST /serial_numbers
    def create
      @serial_number = SerialNumber.new(serial_number_params)

      if @serial_number.save
        redirect_to @serial_number, notice: 'Serial number was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /serial_numbers/1
    def update
      if @serial_number.update(serial_number_params)
        redirect_to @serial_number, notice: 'Serial number was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /serial_numbers/1
    def destroy
      @serial_number.destroy
      redirect_to serial_numbers_url, notice: 'Serial number was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_serial_number
        @serial_number = SerialNumber.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def serial_number_params
        params.require(:serial_number).permit(:name, :number, :good_id, :status)
      end
  end
end
