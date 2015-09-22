module RegularizationTreatment
  class AddressesController < ApplicationController
    before_action :set_step

    def new
     session[:requeriment_id] = params[:requeriment_id] if params[:requeriment_id].present?
     @requeriment = Regularization::Requeriment.find(session[:requeriment_id])
    end

    def create
    end

    private

    def set_step
      @step = "address"
    end
  end
end