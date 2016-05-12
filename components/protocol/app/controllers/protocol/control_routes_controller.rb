require_dependency 'protocol/application_controller'

module Protocol
    class ControlRoutesController < ApplicationController
        before_action :set_control
        before_action :set_control_routes, only: [:index, :create, :destroy, :update]
        before_action :set_control_route, only: [:edit, :destroy, :update]

        def index
          # authorize :allotment,  :index?
        end

        def new
          #  authorize :allotment,  :create?
            @control_route = @control.control_routes.new

        end

        def create
            #authorize :allotment,  :create?
            @control_route = @control.control_routes.new(control_route_params)
            @control_route.save
            redirect_to action: 'index'

        end

        def edit
        end

        def update
            #authorize :allotment,  :update?
            @control_route.update(control_route_params)
        end

        def destroy
            #authorize :allotment,  :destroy?
            if @control_route.destroy
                redirect_to action: 'index'
            end
        end

        private

        def control_route_params
            params.require(:control_route).permit(:responded, :bureau_route,:conduct, :link, :redistribuited, :need_answer, :finalized, :route_sector_id, :route_staff_id, :route_sector_date, :redistribuited_to)
        end

        def set_control_routes
           @control_routes = @control.control_routes.all
        end

        def set_control
            @control = Control.find(params[:control_id])
        end

        def set_control_route
            @control_route = ControlRoute.find(params[:id])
        end
    end
end
