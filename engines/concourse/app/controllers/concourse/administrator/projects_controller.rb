module Concourse
  class Administrator::ProjectsController < ApplicationController
    layout 'layouts/material'
    before_action :set_project, only: [:show, :edit, :update, :destroy]

    # GET /projects
    def index
      @projects = Project.all
    end

    # GET /projects/1
    def show
      @module = "candidates"
    end

    # GET /projects/new
    def new
      @project = Project.new
    end

    # GET /projects/1/edit
    def edit
    end

    # POST /projects
    def create
      @project = Project.new(project_params)

      if @project.save
        flash[:success] =  t :success
        redirect_to action: 'index'
      else
        render :new
      end
    end

    # PATCH/PUT /projects/1
    def update
      if @project.update(project_params)
        flash[:success] =  t :success
        redirect_to action: 'index'
       else
        render :edit
      end
    end

    # DELETE /projects/1
    def destroy
      @project.destroy
      redirect_to projects_url, notice: 'Project was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_project
        @project = Project.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def project_params
        params.require(:project).permit(:name, :description, :send_project, :subscribe, :background, :logo, :start, :end, :hour_end, :status, :project_category_id)
      end
  end
end
