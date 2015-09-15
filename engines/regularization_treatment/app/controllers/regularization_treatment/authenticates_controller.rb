module RegularizationTreatment
  class AuthenticatesController < ApplicationController

    def new
       #refatorar
       @authenticate = RegularizationTreatment::Authenticate.new
       @id = params[:id]
    end

    def create
    end

    private

    def set_step
      @step = "address"
    end
  end
end