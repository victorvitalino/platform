require_dependency "patrimony/application_controller"

module Patrimony
  class GoodsController < ApplicationController
    before_action :set_good, only: [:show, :edit, :update, :destroy]

    # GET /goods
    def index
      @goods = Good.all
    end

    # GET /goods/1
    def show
    end

    # GET /goods/new
    def new
      @good = Good.new
    end

    # GET /goods/1/edit
    def edit
    end

    # POST /goods
    def create
      @good = Good.new(good_params)

      if @good.save
        redirect_to @good, notice: 'Good was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /goods/1
    def update
      if @good.update(good_params)
        redirect_to @good, notice: 'Good was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /goods/1
    def destroy
      @good.destroy
      redirect_to goods_url, notice: 'Good was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_good
        @good = Good.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def good_params
        params.require(:good).permit(:code_goods, :date_acquisition, :status, :sector_id, :user_id, :material_id, :property_id)
      end
  end
end
