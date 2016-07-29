require_dependency "cms/application_controller"

module Cms
  class ServiceResultsController < ApplicationController
    before_action :set_service_result, only: [:show, :edit, :update, :destroy]

    def index
      @service_results = apply_scopes(ServiceResult).paginate(:page => params[:page], :per_page => 20)

    end

    # GET /service_results/1
    def show

    end

    # GET /service_results/new
    def new
      @service_result = ServiceResult.new

    end

    # GET /service_results/1/edit
    def edit

    end

    # POST /service_results
    def create
      @service_result = ServiceResult.new(service_result_params)

      if @service_result.save
        redirect_to action: 'index'
      else
        render :new
      end
    end

    # PATCH/PUT /service_results/1
    def update

      if @service_result.update(service_result_params)
        redirect_to action: 'index'
      else
        render :edit
      end
    end

    # DELETE /service_results/1
    def destroy

      @service_result.destroy
      redirect_to service_results_url, notice: 'ServiceResult was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_service_result
        @service_result = Cms::ServiceResult.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def service_result_params
        params.require(:service_result).permit(:program_morarbem, :ombudsman,:protocol, :contract, :status, :date, :regularization)
      end
  end
end
