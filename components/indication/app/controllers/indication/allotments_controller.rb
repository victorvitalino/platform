require_dependency 'indication/application_controller'

module Indication
  class AllotmentsController < ApplicationController
    
    def index
      @allotments = Indication::Allotment.all
    end

    def new
      @allotment = Indication::Allotment.new
    end

    def create
      @allotment = Indication::Allotment.new(set_params)
      if @allotment.save
        redirect_to action: :index
      else
        render action: :new
      end
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private


    def set_params
      params.require(:allotment).permit(:name)
    end

    def set_allotment
      @allotment =  Indication::Allotment.find(params[:id])
    end

  end
end 