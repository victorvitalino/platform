require_dependency 'brb/application_controller'

module Brb
  class RemittancesController < ApplicationController

    def index
      @remittance = Remittance.new
      @remittance.generate(params[:date])

      render layout: 'brb/invoice' 
    end

    def show
      @remittance = Remittance.find(params[:id])
      render layout: 'brb/invoice' 
    end

    def new
    end


  end
end