require_dependency "patrimony/application_controller"

module Patrimony
  class DownGoodsController < ApplicationController
    before_action  :set_down_goods, only: [:index, :create, :destroy, :update]
    before_action :set_down_good, only: [:edit, :destroy, :update]
    before_action :set_good, only: [:new, :create]

    
    def index
      
    end

    
    def new
      @down_good = @good.down_goods.new
    end

    
    def edit
    end

    
    def create
      @down_good = @good.down_goods.new(down_good_params)
      @down_good.save
    end

    
    def update
     @down_good.update(down_good_params)
    end

    
    def destroy
      if @down_good.destroy 
        redirect_to action: 'index'
      end
    end

    private
      def down_good_params
        params.require(:down_good).permit(:name, :description, :status, :number_process, :good_id)
      end

      def set_down_good
        @down_good = DownGood.find(params[:id])
      end

      def set_good
        @good = Good.find(params[:good_id])
      end

      def set_down_goods
        @down_goods = DownGood.all
      end
  end
end
