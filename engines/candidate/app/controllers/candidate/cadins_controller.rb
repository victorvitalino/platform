require_dependency "candidate/application_controller"

module Candidate
  class CadinsController < ApplicationController
    before_action :set_cadin, only: [:show, :edit, :update, :destroy]

    # GET /cadins
    def index
      authorize :cadin,  :index?
      @cadins = Cadin.all
    end

    # GET /cadins/1
    def show
      authorize :cadin,  :index?
    end

    # GET /cadins/new
    def new
      authorize :cadin,  :create?
      @cadin = Cadin.new
    end

    # GET /cadins/1/edit
    def edit
    end

    # POST /cadins
    def create
      authorize :cadin,  :create?
      @cadin = Cadin.new(cadin_params)

      if @cadin.save
        flash[:success] = "Operação concluída com sucesso."
        redirect_to @cadin
      else
        render :new
      end
    end

    # PATCH/PUT /cadins/1
    def update
      authorize :cadin,  :update?
      if @cadin.update(cadin_params)
        flash[:success] = "Operação concluída com sucesso."
        redirect_to @cadin
      else
        render :edit
      end
    end

    # DELETE /cadins/1
    def destroy
      authorize :cadin,  :destroy?
      @cadin.destroy
      flash[:success] = "Operação concluída com sucesso."
      redirect_to cadins_url
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
