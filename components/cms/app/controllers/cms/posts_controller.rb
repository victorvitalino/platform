require_dependency "cms/application_controller"

module Cms
  class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :destroy]

    # GET /posts
    def index
      @posts = Post.all
      authorize :post, :index?
    end

    # GET /posts/1
    def show
      authorize :post, :index?
    end

    # GET /posts/new
    def new
      @post = Post.new
      authorize :post, :create?
    end

    # GET /posts/1/edit
    def edit
     authorize :post, :update?
    end

    # POST /posts
    def create
      @post = Post.new(post_params)
     authorize :post, :create?
      if @post.save
        redirect_to action: 'index'
      else
        render :new
      end
    end

    # PATCH/PUT /posts/1
    def update
      authorize :post, :update?
      if @post.update(post_params)
        redirect_to action: 'index'
      else
        render :edit
      end
    end

    # DELETE /posts/1
    def destroy
      authorize :post, :destroy?
      @post.destroy
      redirect_to posts_url, notice: 'Post was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_post
        @post = Cms::Post.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def post_params
        params.require(:post).permit(:title, :content, :post_category_id, :slider, :thumb, :label_link, :thumbnail, :resume, :date, :publish, :photo_author, :photo_description, :active_photo, :author, :link, :flickr)
      end
  end
end
