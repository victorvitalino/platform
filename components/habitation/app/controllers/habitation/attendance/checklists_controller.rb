require_dependency 'habitation/application_controller'

module Habitation
  module Attendance
    class ChecklistsController < ApplicationController
      before_action :set_mirror

      def index
      end

      def update
      end
      
      private

      def set_mirror
        @mirror = Candidate::CadastreMirror.find(params[:mirror_id])
      end
    end
  end
end