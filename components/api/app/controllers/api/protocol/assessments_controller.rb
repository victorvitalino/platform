require_dependency 'api/application_controller'

module Api
  module Protocol
    class AssessmentsController < ApplicationController
    
      def index
        @assessment = ::Protocol::Assessment.find_by_document_number(params[:id])
        render json: @assessment
      end
      
    end
  end
end