require_dependency 'portal/application_controller'

module Portal
  class PagesController < ApplicationController

    def index
      @page = Page.all
    end

    def show 
      @page = Cms::Page.friendly.find(params[:id]) #@rescue Cms::Page.find(params[:id])
    end


  end
end
