require_dependency "patrimony/application_controller"

module Patrimony
  class PatrimoniesController < ApplicationController
    before_action :set_patrimony, only: [:show, :edit, :update, :destroy]

    # GET /patrimonies
    def index
      @patrimonies = Patrimony.all
    end

    # GET /patrimonies/1
    def show
    end

    # GET /patrimonies/new
    def new
      @patrimony = Patrimony.new
    end

    # GET /patrimonies/1/edit
    def edit
    end

    # POST /patrimonies
    def create
      @patrimony = Patrimony.new(patrimony_params)

      if @patrimony.save
        redirect_to @patrimony, notice: 'Patrimony was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /patrimonies/1
    def update
      if @patrimony.update(patrimony_params)
        redirect_to @patrimony, notice: 'Patrimony was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /patrimonies/1
    def destroy
      @patrimony.destroy
      redirect_to patrimonies_url, notice: 'Patrimony was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_patrimony
        @patrimony = Patrimony.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def patrimony_params
        params.require(:patrimony).permit(:code_patrimony, :date_acquisition, :status, :sector_id, :user_id, :material_id, :property_id)
      end
  end
end
