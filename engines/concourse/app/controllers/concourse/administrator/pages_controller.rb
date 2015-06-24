module Concourse
  class Administrator::PagesController < ApplicationController
    layout 'layouts/material'
    before_action :set_page, only: [:show, :edit, :update, :destroy]
    before_action :set_project
    # GET /pages
    def index
      @pages = @project.pages.all
    end

    # GET /pages/1
    def show
    end

    # GET /pages/new
    def new
      @page = @project.pages.new
    end

    # GET /pages/1/edit
    def edit
    end

    # POST /pages
    def create
      @page = @project.pages.new(page_params)

      if @page.save
        flash[:success] = t :success
        redirect_to action: 'index'
      else
        render :new
      end
    end

    # PATCH/PUT /pages/1
    def update
      if @page.update(page_params)
        flash[:success] = t :success
        redirect_to action: 'index'
      else
        render :edit
      end
    end

    # DELETE /pages/1
    def destroy
      if @page.destroy
        flash[:success] = t :success
        redirect_to action: 'index'
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_page
        @page = Page.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def page_params
        params.require(:page).permit(:title, :content, :publish)
      end

      def set_project
        @project = Project.find(params[:project_id])
        @module  = "pages"
      end
  end
end
