require_dependency "patrimony/application_controller"

module Patrimony
  class TypeMaterialsController < ApplicationController
    before_action :set_type_material, only: [:show, :edit, :update, :destroy]

    # GET /type_materials
    def index
      @type_materials = TypeMaterial.all
    end

    # GET /type_materials/1
    def show
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

      if @type_material.save
        redirect_to @type_material, notice: 'Type material was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /type_materials/1
    def update
      if @type_material.update(type_material_params)
        redirect_to @type_material, notice: 'Type material was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /type_materials/1
    def destroy
      @type_material.destroy
      redirect_to type_materials_url, notice: 'Type material was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_type_material
        @type_material = TypeMaterial.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def type_material_params
        params.require(:type_material).permit(:name, :description, :percentage, :life_cycle)
      end
  end
end
