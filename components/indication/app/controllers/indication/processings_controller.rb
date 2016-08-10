require_dependency 'indication/application_controller'

module Indication
  class ProcessingsController < ApplicationController
    
    def new
      @processing = Indication::Processing.new(params)
      @processing.load_step_data
    end
    
    def preview_demand
      @processing = Indication::Processing.new(params[:processing])
      @processing.preview_demand
    end

    def preview
    end
    
  end
end