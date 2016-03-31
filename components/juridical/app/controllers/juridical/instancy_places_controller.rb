require_dependency 'juridical/application_controller'

module Juridical
    class InstancyPlacesController < ApplicationController
        before_action :set_instancy
        before_action :set_instancy_places, only: [:index, :create, :destroy, :update]
        before_action :set_instancy_place, only: [:edit, :destroy, :update]


        def index
           #authorize @lawsuits
        end

        def new
            @instancy_place = @instancy.instancy_places.new
           # authorize @lawsuit
        end

        def create
            @instancy_place = @instancy.instancy_places.new(instancy_place_params)
            #authorize @lawsuit
            @instancy_place.save
        end

        def edit
        end

        def update
          #  authorize @lawsuit
            @instancy_place.update(instancy_place_params)
        end

        def destroy
          #  authorize @lawsuit
            if @instancy_place.destroy
                redirect_to action: 'index'
            end
        end

        private

        def instancy_place_params
            params.require(:instancy_place).permit(:name, :description,:status,:instancy_id)
        end

        def set_instancy_places
            @instancy_places = @instancy.instancy_places.all
        end

        def set_instancy_place
            @instancy_place = InstancyPlace.find(params[:id])
        end

        def set_instancy
            @instancy = Instancy.find(params[:instancy_id])
        end

    end
end
