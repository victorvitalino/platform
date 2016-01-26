module Concourse
  class ConsultsController < ApplicationController
    before_action :set_project

    def index
    end

    def read
      if params[:consult_id].present? && params[:project_id].present?
        @consult = Consult.find(params[:consult_id])
        @project = Project.friendly.find(params[:project_id])
        if @consult.update(status: true)
          flash[:success] = t :success
          redirect_to project_path(id: @project, q: 'consultas')
        else

        end
      end
    end

    def show
      @project = Project.friendly.find(params[:project_id])
      @consult = Consult.find(params[:id])
    end

    private

    def set_project
      @project = Project.friendly.find(params[:project_id])
    end

  end
end