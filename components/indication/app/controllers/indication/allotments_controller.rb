 require_dependency 'indication/application_controller'

module Indication
  class AllotmentsController < ApplicationController
    before_action :set_step

    @@rank_service = {}

    def index
      @allotments = @step.allotments
      @result     = @allotments.sum(:demand)

      respond_to do |format|
        format.json {
          render json: [{data: @allotments, allotments_total: @result, step_demand: @step.demand, current_demand: @step.demand - @result}]
        }

        format.html {}
      end

    end

    def new
      @allotment = @step.allotments.new
    end

    def create
      @allotment = @step.allotments.new(set_params)
      if @allotment.valid?
        @@rank_service = Indication::RankCreationService.new(@allotment)
      end
    end

    def execute
      if @@rank_service.create!
        redirect_to enterprise_step_allotment_path(enterprise_id: @enterprise.id, step_id: @step.id, id: @@rank_service.allotment_id)
      else
        render action: :new
      end
    end

    def show
      @cadastres = apply_scopes(@step.allotments.find(params[:id]).cadastres).includes(:pontuation).order('candidate_pontuations.total DESC')
    end

    def edit
    end

    def update
    end

    def destroy
      @step.allotments.find(params[:id]).destroy
      redirect_to action: :index
    end

    private


    def set_params
      params.require(:allotment).permit(:name, :zone_id, :demand, :rii, :rie, :special, :vulnerable, :old)
    end

    def set_allotment
      @allotment  =  @step.allotments.find(params[:id])
    end

    def set_step
      @step = Project::Step.find(params[:step_id])
      @enterprise = @step.enterprise
    end

  end
end
