require_dependency "concourse/application_controller"

module Concourse
  class NavsController < ApplicationController
    before_action :set_project
    before_action :set_nav, only: [:show, :edit, :update, :destroy]


    # GET /navs
    def index
      @navs = @project.navs
    end

    # GET /navs/1
    def show
    end

    # GET /navs/new
    def new
      @nav = @project.navs.new
    end

    # GET /navs/1/edit
    def edit
    end

    def change_order
      @current_nav = Nav.unscoped.find(params[:nav_id])
      @next_nav    = Nav.unscoped.find(params[:next_nav_id])

      current_order = @current_nav.order
      next_order    = @next_nav.order
      
      @current_nav.update(order: next_order)
      @next_nav.update(order: current_order)

      redirect_to project_path(id: @project, q: 'menus', css_order: @current_nav.id)
    end

    # POST /navs
    def create
      @nav = @project.navs.new(nav_params)

      if @nav.save
        flash[:success] =  t :success
        redirect_to project_path(id: @project, q: 'menus')
       else
        render :new
      end
    end

    # PATCH/PUT /navs/1
    def update
      if @nav.update(nav_params)
        flash[:success] =  t :success
        redirect_to project_path(id: @project, q: 'menus')
       else
        render :edit
      end
    end

    # DELETE /navs/1
    def destroy
      if @nav.destroy
        flash[:success] =  t :success
        redirect_to project_path(id: @project, q: 'menus')
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_nav
        @nav = @project.navs.find(params[:id])
      end

      def set_project
        @project = Project.friendly.find(params[:project_id])
      end

      # Only allow a trusted parameter "white list" through.
      def nav_params
        params.require(:nav).permit(:project_id, :label,:page_id, :url, :target, :action, :publish)
      end
  end
end
