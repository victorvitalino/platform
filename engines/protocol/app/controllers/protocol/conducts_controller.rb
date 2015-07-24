module Protocol
    class ConductsController < ApplicationController
     layout 'layouts/material'
      before_action :set_allotment, except: [:add,:send_conduct]
      before_action :set_conduct, only:[:destroy,:show]
      before_action :set_conducts, only: [:index, :new,:add,:destroy, :send_conduct]


        def index
            authorize @conducts
        end

        def new
            @conduct = @allotment.conducts.new
            authorize @conduct
            @conduct_result = Protocol::Assessment.where(document_number: params[:document], document_type_id: params[:document_type])
        end

        def add
            authorize @conduct
            sector = current_user.account.sector_current.id

            @allotment = Protocol::Allotment.find(params[:id])
            @conduct = @allotment.conducts.new
            @conduct.set_data(current_user, params[:assessment_id])

            if @conduct.save
                flash[:success] = t :success
                redirect_to new_allotment_conduct_path(@allotment)
            else
                flash[:danger] = t :error
                redirect_to action: 'new'
            end
        end

        def send_conduct
           authorize @conduct
           @allotment = Protocol::Allotment.find(params[:allotment_id])
           @conduct = @allotment.conducts.new
        end

        def create
            
            @allotment = Protocol::Conduct.where(allotment_id: params[:allotment_id], conduct_type: 0, sector_id: current_user.account.sector_current.id)
            authorize @conduct
             @allotment.each do |lote|
                @conduct = Protocol::Conduct.new
                @conduct.allotment_id = params[:allotment_id]
                @conduct.conduct_type = 1
                @conduct.assessment_id = lote.assessment_id
                @conduct.sector_id = params[:sector_id]
                @conduct .save
             end

             redirect_to action: 'allotments/index'

        end

        def show
        end


        def destroy
            authorize @conduct
            if @conduct.destroy
                redirect_to action: 'new'
            end
        end

        private


        def set_conducts
            @conducts = Conduct.where(:allotment_id => params[:allotment_id], conduct_type: 0)
        end

        def set_conduct
            @conduct = Conduct.find(params[:id])
        end

        def set_allotment
            @allotment = Allotment.find(params[:allotment_id])
        end

        def set_conduct_params
                params.require(:conduct).permit(:description, :conduct_type,:assessment_id,:sector_id,:allotment_id)
        end

    end
end