require_dependency 'juridical/application_controller'

module Juridical
    class HousingProgramsController < ApplicationController
        before_action :set_housing_programs, only: [:index, :create, :destroy, :update]
        before_action :set_housing_program, only: [:edit, :destroy, :update]

        def index
           #authorize @lawsuits
        end

        def new
            @housing_program = HousingProgram.new
           # authorize @lawsuit
        end

        def create
            @housing_program = HousingProgram.new(housing_program_params)
            #authorize @lawsuit
            @housing_program.save
        end

        def edit
        end

        def update
          #  authorize @lawsuit
            @housing_program.update(housing_program_params)
        end

        def destroy
          #  authorize @lawsuit
            if @housing_program.destroy
                redirect_to action: 'index'
            end
        end

        private

        def housing_program_params
            params.require(:housing_program).permit(:name, :description,:status)
        end

        def set_housing_programs
            @housing_programs = HousingProgram.all
        end

        def set_housing_program
            @housing_program = HousingProgram.find(params[:id])
        end
    end
end
