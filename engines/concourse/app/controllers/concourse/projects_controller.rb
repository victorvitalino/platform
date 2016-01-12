require_dependency "concourse/application_controller"

module Concourse
  class ProjectsController < ApplicationController
    before_action :set_project, only: [:show, :edit, :update, :destroy]

    # GET /projects
    def index
      @projects = Project.unscoped.all
    end

    # GET /projects/1
    def show
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
        flash[:success] = t :success
        redirect_to action:'index'
      else
        render :new
      end
    end

    # PATCH/PUT /projects/1
    def update
      if @project.update(project_params)
        flash[:success] = t :success
        redirect_to action:'index'
      else
        render :edit
      end
    end

    # DELETE /projects/1
    def destroy
      if @project.destroy
        flash[:success] = t :success
        redirect_to action:'index'
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_project
        @project = Project.unscoped.friendly.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def project_params
        params.require(:project).permit(:title, :step, :mini_description, :apresentation,
                                        :start, :end, :publish, :status, :image_header, :image_logo,
                                        :image_footer, :image_slider, :slider, :consultation,
                                        :consultation_start,:slider_html, :consultation_end, :consultation_description)
      end
  end
end
