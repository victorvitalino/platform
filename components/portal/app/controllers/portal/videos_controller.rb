require_dependency 'portal/application_controller'
module Portal
  class VideosController < ApplicationController

    def index
      @videos = Cms::Video.where(publish:true).order(created_at: :desc)
    end

  end
end
