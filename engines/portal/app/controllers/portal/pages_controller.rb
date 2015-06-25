module Portal
  class PagesController < ApplicationController

    def index
      @page = Page.all
    end

    def show
      @page = Cms::Page.find(params[:id])
    end

  end
end
