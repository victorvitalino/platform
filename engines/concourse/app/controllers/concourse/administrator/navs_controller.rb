module Concourse
  class Administrator::NavsController < ApplicationController
    layout 'layouts/material'
    before_action :set_project
    before_action :set_nav, only: [:show, :edit, :update, :destroy]

    # GET /navs
    def index
      @navs = @project.navs.all.order(:order)
    end

    def up
      @nav = Nav.find(params[:nav_id])
      if @nav.up_order
        redirect_to action: 'index'
      end
    end

    def down
      @nav = Nav.find(params[:nav_id])
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

    # POST /navs
    def create
      @nav = @project.navs.new(nav_params)

      if @nav.save
        flash[:success] =  t :success
        redirect_to action: 'index'
      else
        render :new
      end
    end

    # PATCH/PUT /navs/1
    def update
      if @nav.update(nav_params)
        flash[:success] =  t :success
        redirect_to action: 'index'
      else
        render :edit
      end
    end

    # DELETE /navs/1
    def destroy
      if @nav.destroy
        flash[:success] =  t :success
        redirect_to action: 'index'
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_nav
        @nav = Nav.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def nav_params
        params.require(:nav).permit(:link, :target, :order, :project_id, :external_link, :page_id, :page_action, :publish)
      end

      def set_project
        @project = Project.find(params[:project_id])
        @module  = "navs"
      end
  end
end
