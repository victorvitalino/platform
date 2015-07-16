module Protocol
    class ConductTypesController < ApplicationController
     layout 'layouts/material'
      before_action :set_conduct_type, only: [:show, :edit, :update, :destroy]

        def index
            @conduct_type = ConductType.all
        end

        def new
            @conduct_type = ConductType.new

        end
        def create
            @conduct_type = ConductType.new(set_conduct_type_params)
            @conduct_type.save

        end

        def show

        end

        def edit

        end

        def update
         @conduct_type.update(set_conduct_type_params)
        end

        def destroy
            @conduct_type.destroy
        end

        private

         def set_conduct_type
            @conduct_type = ConductType.find(params[:id])
         end


        def set_conduct_type_params
                params.require(:conduct_type).permit(:name, :description, :status)
        end


    end
end