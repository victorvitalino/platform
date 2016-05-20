require_dependency 'protocol/application_controller'

module Protocol
    class ControlRoutesController < ApplicationController
        before_action :set_control
        before_action :set_control_routes, only: [:index, :create, :destroy, :update]
        before_action :set_control_route, only: [:edit, :destroy, :update, :show]

        def index
           authorize :control_route,  :index?
        end

        def new
            authorize :control_route,  :create?
            @control_route = @control.control_routes.new

        end

        def create
            authorize :control_route,  :create?
            @control_route = @control.control_routes.new(control_route_params)
            if @control_route.save
              redirect_to action: 'index'
            else
              render :new
            end

        end

        def edit
        end

        def show
        end

        def update
            authorize :control_route,  :update?
            @control_route.update(control_route_params)
        end

        def destroy
            authorize :control_route,  :destroy?
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
