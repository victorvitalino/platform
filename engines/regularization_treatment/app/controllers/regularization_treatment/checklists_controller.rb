module RegularizationTreatment
  class ChecklistsController < ApplicationController
    before_action :set_step

    def new
    end

    def create
    end

    private

    def set_step
      @step = 'checklist'
    end
    
  end
end