module Concourse
  module Portal
    class ProjectsController < ApplicationController
      layout 'layouts/portal/application'

      def index
        @projects = Project.all
      end

      def show 
        @project = Project.find(params[:id])
      end
    end
  end
end
