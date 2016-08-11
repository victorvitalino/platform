require_dependency 'protocol/application_controller'

module Protocol
    class AllotmentsController < ApplicationController
        before_action :set_allotments, only: [:index, :create, :destroy, :update]
        before_action :set_allotment, only: [:edit, :destroy, :update, :show]

        def index
           authorize :allotment,  :index?
        end

        def new
            authorize :allotment,  :create?
            @allotment = Allotment.new

        end

        def create
            authorize :allotment,  :create?
            @allotment = Allotment.new(allotment_params)
            @allotment.staff_id = current_user.id
            @allotment.sector_id = current_user.sector_current.id

            @allotment.save
        end

        def edit
        end

        def show

        end

        def update
            authorize :allotment,  :update?
            @allotment.update(allotment_params)
        end

        def destroy
            authorize :allotment,  :destroy?
            if @allotment.destroy
                redirect_to action: 'index'
            end
        end

        private

        def allotment_params
            params.require(:allotment).permit(:description,:replay_date, :status,:amount_docs,:sector_id,:staff_id,:priority)
        end

        def set_allotments
            if  current_user.sector_current.present?
              @allotments =   Allotment.where(:sector_id => current_user.sector_current.id)
            else
                flash[:danger] = "Usuário não está alocado em um setor."
                redirect_to '/'
            end

        end

        def set_allotment
            @allotment = Allotment.find(params[:id])
        end
    end
end
