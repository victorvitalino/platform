require_dependency 'concourse_portal/application_controller'

module ConcoursePortal
  module Remember
    class SubscribesController < ApplicationController
      
      def index
        @candidate = ConcoursePortal::Candidate.where(cpf: params[:cpf])
      end
  
    end
  end
end