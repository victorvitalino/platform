require_dependency "cms/application_controller"

module Cms
  class PageCategoriesController < ApplicationController
    before_action :set_page_category, only: [:show, :edit, :update, :destroy]

    # GET /page_categories
    def index
      @page_categories = PageCategory.all
    end

    # GET /page_categories/1
    def show
    end

    # GET /page_categories/new
    def new
      @page_category = PageCategory.new
    end

    # GET /page_categories/1/edit
    def edit
    end

    # POST /page_categories
    def create
      @page_category = PageCategory.new(page_category_params)

      if @page_category.save
        redirect_to action: 'index'
      else
        render :new
      end
    end

    # PATCH/PUT /page_categories/1
    def update
      if @page_category.update(page_category_params)
        redirect_to action: 'index'
      else
        render :edit
      end
    end

    # DELETE /page_categories/1
    def destroy
      @page_category.destroy
      redirect_to page_categories_url, notice: 'Page category was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_page_category
        @page_category = PageCategory.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def page_category_params
        params.require(:page_category).permit(:name, :status)
      end
  end
end
