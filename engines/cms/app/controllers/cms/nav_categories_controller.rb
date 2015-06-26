require_dependency "cms/application_controller"

module Cms
  class NavCategoriesController < ApplicationController
    before_action :set_nav_category, only: [:show, :edit, :update, :destroy]

    # GET /nav_categories
    def index
      @nav_categories = NavCategory.all
      authorize @nav_categories
    end

    # GET /nav_categories/1
    def show
    end

    # GET /nav_categories/new
    def new
      @nav_category = NavCategory.new
      authorize @nav_category
    end

    # GET /nav_categories/1/edit
    def edit
    end

    # POST /nav_categories
    def create
      @nav_category = NavCategory.new(nav_category_params)
      authorize @nav_category
      if @nav_category.save
        redirect_to action: 'index'
      else
        render :new
      end
    end

    # PATCH/PUT /nav_categories/1
    def update
      authorize @nav_category
      if @nav_category.update(nav_category_params)
        redirect_to action: 'index'
      else
        render :edit
      end
    end

    # DELETE /nav_categories/1
    def destroy
      authorize @nav_category
      @nav_category.destroy
      redirect_to nav_categories_url, notice: 'Nav category was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_nav_category
        @nav_category = NavCategory.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def nav_category_params
        params.require(:nav_category).permit(:name, :status)
      end
  end
end
