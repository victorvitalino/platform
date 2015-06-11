require_dependency "patrimony/application_controller"

module Patrimony
  class DrivesController < ApplicationController
    before_action :set_drife, only: [:show, :edit, :update, :destroy]

    # GET /drives
    def index
      @drives = Drive.all
    end

    # GET /drives/1
    def show
    end

    # GET /drives/new
    def new
      @drife = Drive.new
    end

    # GET /drives/1/edit
    def edit
    end

    # POST /drives
    def create
      @drife = Drive.new(drife_params)

      if @drife.save
        redirect_to @drife, notice: 'Drive was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /drives/1
    def update
      if @drife.update(drife_params)
        redirect_to @drife, notice: 'Drive was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /drives/1
    def destroy
      @drife.destroy
      redirect_to drives_url, notice: 'Drive was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_drife
        @drife = Drive.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def drife_params
        params.require(:drife).permit(:date_drive, :sector_old, :user_old, :sector_id, :user_id, :patrimony_id)
      end
  end
end
