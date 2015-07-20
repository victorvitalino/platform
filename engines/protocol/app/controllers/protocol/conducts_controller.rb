module Protocol
    class ConductsController < ApplicationController
     layout 'layouts/material'
      before_action :set_allotment
      before_action :set_conducts, only: [:index, :new,:create, :destroy, :update]
      before_action :set_conduct, only: [ :destroy]

        def index

        end

        def new
            @conduct = @allotment.conduct.new

        end
        def create
            @conduct = @allotment.conduct.new(set_conduct_params)
            @conduct.user_send = current_user.account_id

            @conduct.save

        end

        def show

        end

        def destroy
            @conduct.destroy
        end

        private

         def set_conduct
            @conduct = Conduct.find(params[:id])
         end

        def set_conducts
            @conduct = Conduct.where(:allotment_id => params[:allotment_id])
        end

        def set_allotment
            @allotment = Allotment.find(params[:allotment_id])
        end

        def set_conduct_params
                params.require(:conduct).permit(:replay_date, :description, :conduct_type,:assessment_id,:sector_id)
        end

    end
end