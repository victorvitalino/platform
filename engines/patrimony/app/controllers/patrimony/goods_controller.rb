require_dependency "patrimony/application_controller"
module Patrimony
  class GoodsController < ApplicationController
    before_action :set_goods, only: [:index, :create, :destroy, :update]
    before_action :set_good, only: [:edit, :destroy, :update]

    
    # GET /goods
    def index
      @goods = Good.all
    end


    # GET /goods/new
    def new
      @good = Good.new
      @type_materials = TypeMaterial.all
      @materials = Material.all
    end

    def show 
    end

    # GET /goods/1/edit
    def edit
    end

    # POST /goods
    def create
      @good = Good.new(good_params)
      @good.save
    end

    # PATCH/PUT /goods/1
    def update
     @good.update(good_params)
    end

    # DELETE /goods/1
    def destroy
      if @good.destroy 
        redirect_to action: 'index'
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_good
        @good = Good.find(params[:id])
      end

      def set_goods
        @goods = Good.all
      end

      # Only allow a trusted parameter "white list" through.
      def good_params
        params.require(:good).permit(:code_goods, :date_acquisition, :status, :sector_id, :user_id, :material_id, :property_id, :down_good_id)
      end
  end
end
