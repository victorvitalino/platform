require_dependency "juridical/application_controller"

module Juridical
  class InstancesController < ApplicationController
    before_action :set_instance, only: [:show, :edit, :update, :destroy]

    # GET /instances
    def index
      @instances = Instance.all
    end

    # GET /instances/1
    def show
    end

    # GET /instances/new
    def new
      @instance = Instance.new
    end

    # GET /instances/1/edit
    def edit
    end

    # POST /instances
    def create
      @instance = Instance.new(instance_params)

      if @instance.save
        redirect_to @instance, notice: 'Instance was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /instances/1
    def update
      if @instance.update(instance_params)
        redirect_to @instance, notice: 'Instance was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /instances/1
    def destroy
      @instance.destroy
      redirect_to instances_url, notice: 'Instance was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_instance
        @instance = Instance.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def instance_params
        params.require(:instance).permit(:name, :description)
      end
  end
end
