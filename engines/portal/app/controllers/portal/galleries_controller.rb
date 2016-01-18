require_dependency 'portal/application_controller'
module Portal
  class GalleriesController < ApplicationController

    def index
      @galleries = Cms::Gallery.where(status:true).order(created_at: :desc)
    end

    def show
      @gallery = Cms::Gallery.find(params[:id])
    end

    def galleries_private
      @galleries = Cms::Gallery.where(status:true).order(created_at: :desc)
    end
  end
end
