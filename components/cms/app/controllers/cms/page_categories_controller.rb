require_dependency "cms/application_controller"

module Cms
  class PageCategoriesController < ApplicationController
    before_action :set_page_category, only: [:show, :edit, :update, :destroy]

    # GET /page_categories
    def index
      @page_categories = PageCategory.all
      authorize @page_categories
    end

    # GET /page_categories/1
    def show
    end

    # GET /page_categories/new
    def new
      @page_category = PageCategory.new
      authorize @page_category
    end

    # GET /page_categories/1/edit
    def edit
    end

    # POST /page_categories
    def create
      @page_category = PageCategory.new(page_category_params)
      authorize @page_category
      if @page_category.save
        flash[:success] =  t :success
        redirect_to action: 'index'
      else
        render :new
      end
    end

    # PATCH/PUT /page_categories/1
    def update
      authorize @page_category
      if @page_category.update(page_category_params)
        flash[:success] =  t :success
        redirect_to action: 'index'
      else
        render :edit
      end
    end

    # DELETE /page_categories/1
    def destroy
      authorize @page_category
      @page_category.destroy
      flash[:success] =  t :success
      redirect_to action: 'index'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_page_category
        @page_category = PageCategory.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def page_category_params
        params.require(:page_category).permit(:title, :status, :description)
      end
  end
end
