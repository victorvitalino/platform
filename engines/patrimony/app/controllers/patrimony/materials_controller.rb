require_dependency "patrimony/application_controller"

module Patrimony
  class MaterialsController < ApplicationController
    before_action :set_materials, only: [:index, :create, :destroy, :update]
    before_action :set_material, only: [:edit, :destroy, :update]

    # GET /materials
    def index
      
    end

    # GET /materials/1
    def show
    end

    # GET /materials/new
    def new
      @material = Material.new
    end

    # GET /materials/1/edit
    def edit
    end

    # POST /materials
    def create
      @material = Material.new(material_params)
      @material.save
    end

    # PATCH/PUT /materials/1
    def update
      @material.update(material_params)
    end

    # DELETE /materials/1
    def destroy
      if @material.destroy
        redirect_to action: 'index'
      end
    end

    private
      def material_params
        params.require(:material).permit(:name, :description, :type_material_id, :status)
      end

      def set_material
        @material = Material.find(params[:id])
      end

      def set_materials
        @materials = Material.all
      end
  end
end
