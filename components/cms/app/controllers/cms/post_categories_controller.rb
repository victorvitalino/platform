require_dependency "cms/application_controller"

module Cms
  class PostCategoriesController < ApplicationController
    before_action :set_post_category, only: [:show, :edit, :update, :destroy]

    # GET /post_categories
    def index
      @post_categories = PostCategory.all
      authorize @post_categories
    end

    # GET /post_categories/1
    def show
    end

    # GET /post_categories/new
    def new
      @post_category = PostCategory.new
      authorize @post_category
    end

    # GET /post_categories/1/edit
    def edit
    end

    # POST /post_categories
    def create
      @post_category = PostCategory.new(post_category_params)
      authorize @post_category
      if @post_category.save
        flash[:success] =  t :success
        redirect_to action: 'index'
      else
        render :new
      end
    end

    # PATCH/PUT /post_categories/1
    def update
      authorize @post_category
      if @post_category.update(post_category_params)
        flash[:success] =  t :success
        redirect_to action: 'index'
      else
        render :edit
      end
    end

    # DELETE /post_categories/1
    def destroy
      authorize @post_category
      @post_category.destroy
      flash[:success] =  t :success
      redirect_to post_categories_url, notice: 'Post category was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_post_category
        @post_category = PostCategory.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def post_category_params
        params.require(:post_category).permit(:title, :status)
      end
  end
end
