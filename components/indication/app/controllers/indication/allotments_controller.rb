require_dependency 'indication/application_controller'

module Indication
  class AllotmentsController < ApplicationController
    before_action :set_step

    def index
      @allotments = @step.allotments
    end

    def new
      @allotment = @step.allotments.new
    end

    def create
      @allotment = @step.allotments.new(set_params)

      if @allotment.save
        redirect_to action: :index
      else
        render action: :new
      end
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private


    def set_params
      params.require(:allotment).permit(:name)
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