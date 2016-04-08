require_dependency 'habitation/application_controller'

module Habitation
  module Attendance
    class ConclusionsController < ApplicationController
      before_action :set_mirror

      def index
      end
        
      private

      def set_mirror
        @mirror = Candidate::CadastreMirror.find(params[:mirror_id])
      end

    end
  end
end