require_dependency "juridical/application_controller"

module Juridical
  class ProcessMonitoringsController < ApplicationController
    before_action :set_process_monitoring, only: [:show, :edit, :update, :destroy]

    # GET /process_monitorings
    def index
      @process_monitorings = ProcessMonitoring.all
    end

    # GET /process_monitorings/1
    def show
    end

    # GET /process_monitorings/new
    def new
      @process_monitoring = ProcessMonitoring.new
    end

    # GET /process_monitorings/1/edit
    def edit
    end

    # POST /process_monitorings
    def create
      @process_monitoring = ProcessMonitoring.new(process_monitoring_params)

      if @process_monitoring.save
        redirect_to @process_monitoring, notice: 'Process monitoring was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /process_monitorings/1
    def update
      if @process_monitoring.update(process_monitoring_params)
        redirect_to @process_monitoring, notice: 'Process monitoring was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /process_monitorings/1
    def destroy
      @process_monitoring.destroy
      redirect_to process_monitorings_url, notice: 'Process monitoring was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_process_monitoring
        @process_monitoring = ProcessMonitoring.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def process_monitoring_params
        params.require(:process_monitoring).permit(:number_lawsuit, :number_administrative_process, :organ, :action_type_id, :value_cause, :local_instance_id, :part, :lawyer_responsible_id, :complemet, :status, :initial_date, :end_date, :process_type)
      end
  end
end
