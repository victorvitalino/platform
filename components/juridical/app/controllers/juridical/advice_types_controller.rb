require_dependency 'juridical/application_controller'

module Juridical
    class AdviceTypesController < ApplicationController
        before_action :set_advice_types, only: [:index, :create, :destroy, :update]
        before_action :set_advice_type, only: [:edit, :destroy, :update]

        def index
           #authorize @lawsuits
        end

        def new
            @advice_type = AdviceType.new
           # authorize @lawsuit
        end

        def create
            @advice_type = AdviceType.new(advice_type_params)
            #authorize @lawsuit
            @advice_type.save
        end

        def edit
        end

        def update
          #  authorize @lawsuit
            @advice_type.update(advice_type_params)
        end

        def destroy
          #  authorize @lawsuit
            if @advice_type.destroy
                redirect_to action: 'index'
            end
        end

        private

        def advice_type_params
            params.require(:advice_type).permit(:name, :description,:status)
        end

        def set_advice_types
            @advice_types = AdviceType.all
        end

        def set_advice_type
            @advice_type = AdviceType.find(params[:id])
        end
    end
end
