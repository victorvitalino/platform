module RegularizationTreatment
  class AddressesController < ApplicationController
    before_action :set_step
    def new
      @requeriment = Regularization::Requeriment.find(params[:requeriment_id])
    end

    def create
    end

    private

    def set_step
      @step = "address"
    end
  end
end