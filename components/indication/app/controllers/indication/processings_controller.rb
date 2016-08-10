require_dependency 'indication/application_controller'

module Indication
  class ProcessingsController < ApplicationController
    
    def new
      session[:step_id] = params[:step_id] ||= nil
      @processing = Indication::Processing.new(params)
      @processing.load_step_data
    end
    
    def preview_demand
      @processing = Indication::Processing.new(params[:processing])
      @processing.step_id = session[:step_id]
      @processing.load_step_data
      @processing.preview_demand

      @processing.preview_cadastres if @processing.is_ok?  
      byebug
    end

    def preview
    end
    
  end
end