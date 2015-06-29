require_dependency "cms/application_controller"

module Cms
  class PagesController < ApplicationController
    before_action :set_page, only: [:show, :edit, :update, :destroy]

    # GET /pages
    def index
      @pages = Page.all
      authorize @pages
    end

    # GET /pages/1
    def show
    end

    # GET /pages/new
    def new
      @page = Page.new
      authorize @page
    end

    # GET /pages/1/edit
    def edit
    end

    # POST /pages
    def create
      @page = Page.new(page_params)
      authorize @page

      if @page.save
        redirect_to action: 'index'
      else
        render :new
      end
    end

    # PATCH/PUT /pages/1
    def update
      authorize @page
      if @page.update(page_params)
        redirect_to action: 'index'
      else
        render :edit
      end
    end

    # DELETE /pages/1
    def destroy
      authorize @page
      @page.destroy
      redirect_to pages_url, notice: 'Page was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_page
        @page = Page.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def page_params
        params.require(:page).permit(:title, :content, :link, :author, :publish, :thumbnail, :label_link, :page_category_id, :active_photo, :photo_author, :photo_description, :thumb)
      end
  end
end
