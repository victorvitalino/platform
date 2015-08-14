module Protocol
    class LocationsController < ApplicationController
        layout 'layouts/material'
        before_action :set_locations, only: [:create, :destroy, :update]
        before_action :set_location, only: [:edit, :destroy, :update]
        before_action :set_assessment, only: [:index,:new,:edit]
        def index
           #authorize @locations

        end

        def new
            @location = Location.new
            authorize @location
        end

        def create
            authorize @location
            @assessment = Protocol::Assessment.find(params[:assessment_ids])
                @assessment.each do |a|
                    @location = Location.new(location_params)
                    @location.assessment_id = a.id
                    @location.staff_id = current_user.account.id
                    @location.save
                end
            redirect_to '/protocol/assessment/index'
        end

        def edit
        end

        def update
            authorize @location
            @location.update(location_params)
        end

        def destroy
            authorize @location
            if @location.destroy
                redirect_to action: 'index'
            end
        end

        private

        def location_params
            params.require(:location).permit(:shelf, :pile,:box,:observation,:assessment_id,:staff_id)
        end

        def set_locations
            @locations = Location.all
        end

         def set_assessment
            @assessments = Protocol::Assessment.where(sector_id: current_user.account.sector_current.id)
        end


        def set_location
            @location = Location.find(params[:id])
        end
    end
end
