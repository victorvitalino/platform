require_dependency 'info_center/application_controller'

module InfoCenter
  class DeficitsController < ApplicationController
    before_action :set_deficit, only: [:show, :edit, :update, :destroy]

    def index
      @deficits = Deficit.all
    end

    def new
      @deficit = Deficit.new
    end

    def edit
    end
    def create
      @deficit = Deficit.new(deficit_params)
      if @deficit.save
        redirect_to action: 'index'
      else
        render :new
      end
    end


    def update
      if @deficit.update(deficit_params)
        redirect_to action: 'index'
      else
        render :edit
      end
    end

    def destroy
      @deficit.destroy
      redirect_to deficits_url, notice: 'Post was successfully destroyed.'
    end

    private
      def set_deficit
        @deficit = InfoCenter::Deficit.find(params[:id])
      end

      def deficit_params
        params.require(:deficit).permit( :name,:cpf,:phone,:address,:lot_houses,:lot_people,:water,:light,:sidewalk,:sewer,:asphalt,:bathroom,:total_bathroom,:kitchen,:roof,:slab,:contract,:document,:people_living,:wall,:room,:sleep_local,:rent,:rent_total,:buy_lot)
      end
  end
end
