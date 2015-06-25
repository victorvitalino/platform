module Concourse
  module Portal
    class ProjectsController < ApplicationController
      layout 'layouts/concourse/project'

      def index
        @projects = Project.all
      end

      def show 
        @project = Project.find(params[:id])
      end
    end
  end
end
