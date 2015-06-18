require_dependency "patrimony/application_controller"

module Patrimony
  class DrivesController < ApplicationController
    before_action :set_drives, only: [:index, :create, :destroy, :update]
    before_action :set_drive, only: [:edit, :destroy, :update]

    # GET /drives
    def index
      
    end

    # GET /drives/1
    def show
    end

    # GET /drives/new
    def new
      @drive = Drive.new
      @good = Good.all
    end

    # GET /drives/1/edit
    def edit
    end

    # POST /drives
    def create
      @drive = Drive.new(drive_params)
      @drive.save  
    end

    # PATCH/PUT /drives/1
    def update
      @drive.update(drife_params)
    end

    # DELETE /drives/1
    def destroy
      if @drive.destroy
        redirect_to action: 'index'
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_drive
        @drive = Drive.find(params[:id])
      end

      def set_drives
        @drives = Drive.all
      end

      # Only allow a trusted parameter "white list" through.
      def drive_params
        params.require(:drive).permit(:date_drive, :sector_id, :user_id, :good_id, :status)
      end
  end
end
