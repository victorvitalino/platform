require_dependency "concourse/application_controller"

module Concourse
  class ProjectsController < ApplicationController
    before_action :set_project, only: [:show, :edit, :update, :destroy]
    layout 'shared/remark', only: [:index, :new, :edit]

    def index
      @projects = Project.unscoped.all
      authorize :project, :index?
    end

    def show
      authorize :project, :index?
    end

    def new
      authorize :project, :new?
      @project = Project.new
    end

    def edit
      authorize :project, :edit?
    end

    def create
      authorize :project, :new?
      @project = Project.new(project_params)

      if @project.save
        flash[:success] = t :success
        redirect_to action:'index'
      else
        render :new
      end
    end

    def update
      authorize :project, :edit?
      if @project.update(project_params)
        flash[:success] = t :success
        redirect_to action:'index'
      else
        render :edit
      end
    end

    def destroy
      authorize :project, :destroy?
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
                                        :image_footer, :popup_publish, :popup_title, :popup_content, :image_slider, :slider, :consultation,
                                        :consultation_start,:slider_html, :consultation_end, :consultation_description,
                                        :start_participation, :end_participation, :text_participation, :result_document,
                                        :result_description, :result_date)
      end
  end
end
