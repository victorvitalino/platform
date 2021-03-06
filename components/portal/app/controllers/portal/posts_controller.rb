require_dependency 'portal/application_controller'

module Portal
  class PostsController < ApplicationController

    has_scope :by_title

    def index
      @posts = apply_scopes(Cms::Post).all

      render layout: 'shared/slim_portal'
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
