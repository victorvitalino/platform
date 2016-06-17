module Concourse
  class ConsultsController < ApplicationController
    before_action :set_project

    has_scope :by_status

    def index
      @consults = apply_scopes(@project).consults.paginate(:page => params[:page], :per_page => 20)
      authorize :consult, :index?
    end

    def read
      authorize :consult, :edit?
      if params[:consult_id].present? && params[:project_id].present?
        @consult = Consult.find(params[:consult_id])
        @project = Project.friendly.find(params[:project_id])
        if @consult.update(status: true)
          flash[:success] = t :success
          redirect_to project_consults_path(@project)
        else

        end
      end
    end

    def responded
      authorize :consult, :edit?
      if params[:consult_id].present? && params[:project_id].present?
        @consult = Consult.find(params[:consult_id])
        @project = Project.friendly.find(params[:project_id])
        if @consult.update(responded: true)
          flash[:success] = t :success
          redirect_to project_consults_path(@project)
        else

        end
      end
    end

    def show
      authorize :consult, :index?
      @project = Concourse::Project.friendly.find(params[:project_id])
      @consult = Concourse::Consult.find(params[:id])
    end

    private

    def set_project
      @project = Concourse::Project.friendly.find(params[:project_id])
    end

  end
end