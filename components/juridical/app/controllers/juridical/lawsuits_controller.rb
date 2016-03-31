require_dependency 'juridical/application_controller'

module Juridical
    class LawsuitsController < ApplicationController
        before_action :set_lawsuits, only: [:index, :create, :destroy, :update]
        before_action :set_lawsuit, only: [:edit, :destroy, :update]

        def index
           #authorize @lawsuits
        end

        def new
            @lawsuit = Lawsuit.new
           # authorize @lawsuit
        end

        def create
            @lawsuit = Lawsuit.new(lawsuit_params)
            #authorize @lawsuit
            @lawsuit.save
        end

        def edit
        end

        def update
          #  authorize @lawsuit
            @lawsuit.update(lawsuit_params)
        end

        def destroy
          #  authorize @lawsuit
            if @lawsuit.destroy
                redirect_to action: 'index'
            end
        end

        private

        def lawsuit_params
            params.require(:lawsuit).permit(:name, :description,:status)
        end

        def set_lawsuits
            @lawsuits = Lawsuit.all
        end

        def set_lawsuit
            @lawsuit = Lawsuit.find(params[:id])
        end
    end
end
