require_dependency 'concourse_portal/application_controller'

module ConcoursePortal
  module SubscribeCandidate
    class CandidatesController < ApplicationController
      before_action :set_project
      before_action :set_subscribe, except: [:index]

      def index
      end
    
      def new
        @candidate = @subscribe.candidates.new
      end

      def create
        @candidate = @subscribe.candidates.new(set_params)

        if @candidate.save
          flash[:success] = t :success
          redirect_to action: 'success'
        else
          render action: 'new'
        end
      end

      def success
      end

      private

      def set_params
      end

      def set_project
        @project = Concourse::Project.friendly.find(params[:project_id])
      end  

      def set_subscribe
        session[:subscribe_id] = params[:subscribe_id] unless session[:subscribe_id].present?

        @subscribe = ConcoursePortal::Subscribe.find(session[:subscribe_id]) rescue nil

        redirect_to '/404' if @subscribe.nil?
      end
    end
  end
end