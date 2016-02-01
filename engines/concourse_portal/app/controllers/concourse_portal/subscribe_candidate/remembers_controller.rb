require_dependency 'concourse_portal/application_controller'

module ConcoursePortal
  module SubscribeCandidate
    class RemembersController < ApplicationController
      
      def index
        @candidate = ConcoursePortal::Candidate.where(cpf: params[:cpf])
      end
  
    end
  end
end