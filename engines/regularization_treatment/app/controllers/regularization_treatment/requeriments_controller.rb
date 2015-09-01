module RegularizationTreatment
  class RequerimentsController < ApplicationController

    def show
      @requeriment = Regularization::Requeriment.find(params[:id])
      session[:cpf] = @requeriment.cpf
    end

  end
end