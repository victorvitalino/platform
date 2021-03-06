require_dependency 'protocol/application_controller'

module Protocol
    class LocationsController < ApplicationController
        before_action :set_locations, only: [:create, :destroy, :update]
        before_action :set_location, only: [:edit, :destroy, :update]
        before_action :set_assessment, only: [:index,:new,:edit]
        has_scope :doc_type
        has_scope :process

        def index
           authorize :conduct,  :index?

        end

        def new
            @location = Location.new
             authorize :location,  :create?
        end

        def create
            authorize :location,  :create?
            @assessment = Protocol::Assessment.find(params[:assessment_ids])
                @assessment.each do |a|
                    @location = Location.new(location_params)
                    @location.assessment_id = a.id
                    @location.staff_id = current_user.id
                    @location.save
                end
            redirect_to asessments_path
        end

        def edit
        end

        def update
            authorize :location,  :update?
            @location.update(location_params)
        end

        def destroy
            authorize :location,  :destroy?
            if @location.destroy
                redirect_to action: 'index'
            end
        end

        private

        def location_params
            params.require(:location).permit(:shelf, :pile,:box,:observation,:assessment_id,:staff_id, :network_path)
        end

        def set_locations
            @locations = Location.all
        end

         def set_assessment
            if  current_user.sector_current.present?
             @assessments = Protocol::Assessment.where(sector_id: current_user.sector_current.id)
             @assessments = apply_scopes(@assessments).paginate(:page => params[:page], :per_page => 20)
            else
                flash[:danger] = "Usuário não está alocado em um setor."
                redirect_to '/'
            end
        end


        def set_location
            @location = Location.find(params[:id])
        end
    end
end
