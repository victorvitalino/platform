require_dependency 'regularization/application_controller'

module Regularization
  class AddressesController < ApplicationController
    
    def new
      session[:address_id] = nil
      @address = Regularization::Address.new
    end

    def create
      @address = Regularization::Address.new(set_params)

      if @address.valid?
          session[:address_id] = @address.id
          redirect_to regularization.new_requeriment_path
      else
        render :new
      end
    end

    private

    def set_params
      params.require(:address).permit(:city, :block, :group, :unit, :id)
    end
    
  end
end