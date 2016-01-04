require_dependency 'brb/application_controller'

module Brb
  class RemittancesController < ApplicationController

    def index
      @remittances = Remittance.all.order('created_at DESC')
    end

    def show
      @remittance = Remittance.find(params[:id])
      render layout: 'brb/invoice' 
    end

    def new
      @remittance = Remittance.new
      @remittance.generate

      render layout: 'brb/invoice' 
    end


  end
end