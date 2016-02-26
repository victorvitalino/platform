require 'concourse_portal/application_controller'

module ConcoursePortal
  module Restrict
    class SessionsController < ApplicationController
      before_action :set_project

      def new
        session[:candidate_id] = nil
        @session = Session.new
      end

      def create
        @session = Session.new(set_params)
        
        if @session.valid?
          session[:candidate_id] = @session._id
          @candidate = Concourse::Candidate.find(@session._id)
          redirect_to project_restrict_candidates_path(@candidate.subscribe.project.slug)
        else
          render action: :new
        end
      end

      private

      def set_params
        params.require(:session).permit(:subscribe, :password)
      end
      
      def set_project
        @project = Concourse::Project.friendly.find(params[:project_id])
      end
    end
  end
end