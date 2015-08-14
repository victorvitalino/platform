require_dependency "juridical/application_controller"

module Juridical
  class LocalInstancesController < ApplicationController
    before_action :set_local_instance, only: [:show, :edit, :update, :destroy]

    # GET /local_instances
    def index
      @local_instances = LocalInstance.all
    end

    # GET /local_instances/1
    def show
    end

    # GET /local_instances/new
    def new
      @local_instance = LocalInstance.new
    end

    # GET /local_instances/1/edit
    def edit
    end

    # POST /local_instances
    def create
      @local_instance = LocalInstance.new(local_instance_params)

      if @local_instance.save
        redirect_to @local_instance, notice: 'Local instance was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /local_instances/1
    def update
      if @local_instance.update(local_instance_params)
        redirect_to @local_instance, notice: 'Local instance was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /local_instances/1
    def destroy
      @local_instance.destroy
      redirect_to local_instances_url, notice: 'Local instance was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_local_instance
        @local_instance = LocalInstance.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def local_instance_params
        params.require(:local_instance).permit(:name, :description, :instance_id)
      end
  end
end
