require_dependency 'brb/application_controller'

module Brb
  class ReturnsController < ApplicationController

    def index
    end

    def create
      @return = Return.new(set_params)
      
      if @return.valid?
        @return.process!
        redirect_to invoices_path
      else
        render action: 'new'
      end
    end

    def new
      @return = Return.new
    end

    private

    def set_params
      params.require(:return).permit(:file)
    end

  end
end