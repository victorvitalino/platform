module Protocol
    class AllotmentsController < ApplicationController
        layout 'layouts/material'
        before_action :set_allotments, only: [:index, :create, :destroy, :update]
        before_action :set_allotment, only: [:edit, :destroy, :update]

        def index
           authorize @allotments
        end

        def new
            @allotment = Allotment.new
            authorize @allotment
        end

        def create
            @allotment = Allotment.new(allotment_params)
            @allotment.staff_id = current_user.account_id
            @allotment.sector_id = current_user.account.sector_current.id
            authorize @allotment
            @allotment.save
        end

        def edit
        end

        def update
            authorize @allotment
            @allotment.update(allotment_params)
        end

        def destroy
            authorize @allotment
            if @allotment.destroy
                redirect_to action: 'index'
            end
        end

        private

        def allotment_params
            params.require(:allotment).permit(:description,:replay_date, :status,:amount_docs,:sector_id,:staff_id,:priority)
        end

        def set_allotments
            @allotments =   Allotment.where(:sector_id => current_user.account.sector_current.id, status: false)
        end

        def set_allotment
            @allotment = Allotment.find(params[:id])
        end
    end
end
