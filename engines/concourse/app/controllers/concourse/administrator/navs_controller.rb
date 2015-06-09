module Concourse
  class Administrator::NavsController < ApplicationController
    layout 'layouts/material'
    before_action :set_project
    before_action :set_nav, only: [:show, :edit, :update, :destroy]

    # GET /navs
    def index
      @navs = Nav.all
    end

    # GET /navs/1
    def show
    end

    # GET /navs/new
    def new
      @nav = Nav.new
    end

    # GET /navs/1/edit
    def edit
    end

    # POST /navs
    def create
      @nav = Nav.new(nav_params)

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
      @nav.destroy
      redirect_to navs_url, notice: 'Nav was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_nav
        @nav = Nav.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def nav_params
        params.require(:nav).permit(:link, :target, :order, :external_link, :page_id, :page_action, :publish)
      end

      def set_project
        @project = Project.find(params[:project_id])
        @module  = "navs"
      end
  end
end
