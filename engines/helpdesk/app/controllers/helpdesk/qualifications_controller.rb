require_dependency "helpdesk/application_controller"

module Helpdesk
  class QualificationsController < ApplicationController
    before_action :set_qualification, only: [:show, :edit, :update, :destroy]

    # GET /qualifications
    def index
      @qualifications = Qualification.all
    end

    # GET /qualifications/1
    def show
    end

    # GET /qualifications/new
    def new
      @qualification = Qualification.new
    end

    # GET /qualifications/1/edit
    def edit
    end

    # POST /qualifications
    def create
      @qualification = Qualification.new(qualification_params)

      if @qualification.save
        redirect_to @qualification, notice: 'Qualification was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /qualifications/1
    def update
      if @qualification.update(qualification_params)
        redirect_to @qualification, notice: 'Qualification was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /qualifications/1
    def destroy
      @qualification.destroy
      redirect_to qualifications_url, notice: 'Qualification was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_qualification
        @qualification = Qualification.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def qualification_params
        params.require(:qualification).permit(:name, :status, :order_service_id)
      end
  end
end
