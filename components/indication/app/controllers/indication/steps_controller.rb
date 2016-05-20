require_dependency 'indication/application_controller'

module Indication
  class StepsController < ApplicationController
    before_action :set_project
    before_action :set_step, only: [:edit, :update]
    before_action :set_steps

    def index
    end

    def new
      @step  = @enterprise.steps.new 
    end

    def create 
      @step  = @enterprise.steps.new(set_params) 
      @step.save
    end

    def edit
    end

    def update
      @step.update(set_params)
    end


    private

    def set_params
      params.require(:step).permit(:name, :text, :demand, :rii, :rie, :old, :special, :vulnerable,
                                   :situation, :status)
    end

    def set_project
      @enterprise = Project::Enterprise.find(params[:enterprise_id])
    end

    def set_step
      @step = @enterprise.steps.find(params[:id])
    end

    def set_steps
      @steps = @enterprise.steps
    end
    
  end
end
    