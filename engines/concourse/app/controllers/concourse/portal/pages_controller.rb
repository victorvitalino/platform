module Concourse
  class Portal::PagesController < ApplicationController
    layout 'layouts/concourse/project'
    before_action :set_project

    def show
      @page = Page.find(params[:id])
    end

    private

    def set_project
      @project = Project.find(params[:project_id])
    end

  end
end