require_dependency "concourse/application_controller"

module Concourse
  class PagesController < ApplicationController
    before_action :set_project
    before_action :set_page, only: [:show, :edit, :update, :destroy]
    # GET /pages
    def index
      @pages = @project.pages
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
        flash[:success] =  t :success
        redirect_to project_path(id: @project, q: 'paginas')
      else
        render :new
      end
    end

    # PATCH/PUT /pages/1
    def update
      if @page.update(page_params)
        flash[:success] =  t :success
        redirect_to project_path(id: @project, q: 'paginas')
      else
        render :edit
      end
    end

    # DELETE /pages/1
    def destroy
      if @page.destroy
        flash[:success] =  t :success
        redirect_to project_path(id: @project, q: 'paginas')
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_page
        @page = @project.pages.friendly.find(params[:id])
      end

      def set_project
        @project = Project.friendly.find(params[:project_id])
      end
      # Only allow a trusted parameter "white list" through.
      def page_params
        params.require(:page).permit(:project_id, :title, :content, :publish, :slug)
      end
  end
end
