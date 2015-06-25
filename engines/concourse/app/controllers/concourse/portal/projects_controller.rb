module Concourse
  module Portal
    class ProjectsController < ApplicationController

      def index
        @projects = Project.all
        render :layout => 'layouts/concourse/projects'
      end

      def show 
        @project = Project.find(params[:id])
        render :layout => 'layouts/concourse/project'
      end
    end
  end
end
