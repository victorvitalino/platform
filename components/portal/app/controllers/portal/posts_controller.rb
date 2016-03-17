require_dependency 'portal/application_controller'

module Portal
  class PostsController < ApplicationController

    # GET /posts
    def index
      @post = Post.all
    end

    # GET /posts/1
    def show
      @post = Cms::Post.find(params[:id])
    end

    private

    def search

    
    end
  end
end
