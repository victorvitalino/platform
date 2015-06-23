require_dependency "patrimony/application_controller"

module Patrimony
  class PropertiesController < ApplicationController
    before_action :set_properties, only: [:index, :create, :destroy, :update]
    before_action :set_property, only: [:edit, :update, :destroy]

    # GET /properties
    def index
      
    end

    # GET /properties/new
    def new
      @property = Property.new
    end

    # GET /properties/1/edit
    def edit
    end

    # POST /properties
    def create
      @property = Property.new(property_params)
      @property.save
    end

    # PATCH/PUT /properties/1
    def update
      @property.update(property_params)
    end

    # DELETE /properties/1
    def destroy
      if @property.destroy
        redirect_to action: 'index'
      end
    end

    private
      def property_params
        params.require(:property).permit(:name, :description, :status)
      end
      
      def set_property
        @property = Property.find(params[:id])
      end

      def set_properties
        @properties = Property.all
      end
  end
end
