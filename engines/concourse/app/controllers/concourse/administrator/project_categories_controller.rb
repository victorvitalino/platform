module Concourse
  class Administrator::ProjectCategoriesController < ApplicationController
    layout 'layouts/material'
    before_action :set_project_category, only: [:show, :edit, :update, :destroy]

    # GET /project_categories
    def index
      @project_categories = ProjectCategory.all
    end

    # GET /project_categories/1
    def show
    end

    # GET /project_categories/new
    def new
      @project_category = ProjectCategory.new
    end

    # GET /project_categories/1/edit
    def edit
    end

    # POST /project_categories
    def create
      @project_category = ProjectCategory.new(project_category_params)

      if @project_category.save
        redirect_to @project_category, notice: 'Project category was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /project_categories/1
    def update
      if @project_category.update(project_category_params)
        redirect_to @project_category, notice: 'Project category was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /project_categories/1
    def destroy
      @project_category.destroy
      redirect_to project_categories_url, notice: 'Project category was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_project_category
        @project_category = ProjectCategory.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def project_category_params
        params.require(:project_category).permit(:name, :status)
      end
  end
end
