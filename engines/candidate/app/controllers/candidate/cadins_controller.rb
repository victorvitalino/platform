require_dependency "candidate/application_controller"

module Candidate
  class CadinsController < ApplicationController
    before_action :set_cadin, only: [:show, :edit, :update, :destroy]

    # GET /cadins
    def index
      @cadins = Cadin.all
    end

    # GET /cadins/1
    def show
    end

    # GET /cadins/new
    def new
      @cadin = Cadin.new
    end

    # GET /cadins/1/edit
    def edit
    end

    # POST /cadins
    def create
      @cadin = Cadin.new(cadin_params)

      if @cadin.save
        redirect_to @cadin, notice: 'Cadin was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /cadins/1
    def update
      if @cadin.update(cadin_params)
        redirect_to @cadin, notice: 'Cadin was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /cadins/1
    def destroy
      @cadin.destroy
      redirect_to cadins_url, notice: 'Cadin was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_cadin
        @cadin = Cadin.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def cadin_params
        params.require(:cadin).permit(:number_control, :name, :born, :process, :occurrence_cadin_id, :signed_instrument_id, :place_birth, :uf_born, :address, :cep, :city_id, :cpf, :rg, :distribution_date, :percentage, :observation, :espolio, :freedup)
      end
  end
end
