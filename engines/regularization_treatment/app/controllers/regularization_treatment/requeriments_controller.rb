module RegularizationTreatment
  class RequerimentsController < ApplicationController
    
    def show
      @requeriment = Regularization::Requeriment.find(params[:id])
    end

  end
end