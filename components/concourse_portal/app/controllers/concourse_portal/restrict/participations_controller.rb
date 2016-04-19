require 'concourse_portal/application_controller'

module ConcoursePortal
  module Restrict
    class ParticipationsController < ApplicationController
      before_action :set_project
      before_action :set_candidate

      def index
        @participation = @candidate.candidate_participation.new
      end

      def show
        @participation = @candidate.candidate_participation.find(params[:id])
      end

      def create
        @participation = @candidate.candidate_participation.new(set_params)
        if @participation.save
          ConcoursePortal::SubscribeMailer.project_send(@candidate.email,@candidate.id, @candidate.subscribe.project_id).deliver_now
          redirect_to action: :show, project_id: @project.slug, id: @participation.id
        else
          render action: :index
        end
      end

      def destroy
        @participation = @candidate.candidate_participation.last
        @participation.destroy
        flash[:success] =  "Projeto cancelado com sucesso!"
        redirect_to action: :index
      end

      private

      def set_project
        @project = Concourse::Project.friendly.find(params[:project_id])
      end

      def set_params
        params.require(:candidate_participation).permit(:team_description, :archive_one, :archive_two,
                                             :archive_three, :archive_four, :archive_five)
      end

      def set_candidate
        @candidate = Concourse::Candidate.find(session[:candidate_id])
      end
    end
  end
end