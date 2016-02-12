require_dependency "firm/application_controller"

module Firm
  class TipologiesController < ApplicationController

    before_action :set_tipologies, only: [:index, :create, :destroy, :update]
    before_action :set_tipology, only: [:edit, :destroy, :update, :show]


    def index

    end

    def new
      @tipology = Tipology.new
      #authorize @company
    end

    def create
      @tipology = Tipology.new(tipology_params)
      #authorize @company
      @tipology.save
      redirect_to action: 'index'
    end

    def edit
    end

    def show
    end

    def update
      #authorize @company
      @tipology.update(tipology_params)
    end

    def destroy
      #authorize @company
      if @tipology.destroy
        redirect_to action: 'index'
      end
    end

    private

    def tipology_params
      params.require(:tipology).permit(:name,:home_type,:private_area, :income_family,:initial_value, :end_value, :status)
    end

    def set_tipologies
      @tipologies = Tipology.all
    end

    def set_tipology
      @tipology = Tipology.find(params[:id])
    end
  end
end
