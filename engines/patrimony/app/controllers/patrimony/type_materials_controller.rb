require_dependency "patrimony/application_controller"

module Patrimony
  class TypeMaterialsController < ApplicationController
    before_action :set_type_materials, only: [:index, :create, :destroy, :update]
    before_action :set_type_material, only: [:edit, :destroy, :update]

    # GET /type_materials
    def index
    end

    # GET /type_materials/new
    def new
      @type_material = TypeMaterial.new
    end

    # GET /type_materials/1/edit
    def edit
    end

    # POST /type_materials
    def create
      @type_material = TypeMaterial.new(type_material_params)
      @type_material.save 
    end

    # PATCH/PUT /type_materials/1
    def update
      @type_material.update(type_material_params)
    end

    # DELETE /type_materials/1
    def destroy
      if @type_material.destroy
        redirect_to action: 'index'
      end  
    end

    private
      
     
      def type_material_params
        params.require(:type_material).permit(:name, :description, :percentage, :life_cycle, :status)
      end

      def set_type_material
        @type_material = TypeMaterial.find(params[:id])
      end

      def set_type_materials
        @type_materials = TypeMaterial.all
      end

  end
end
