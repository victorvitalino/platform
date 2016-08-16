require_dependency 'attendance/application_controller'

module Attendance
  module Enabled
    class OccurencesController < ApplicationController
      before_action :set_cadastre_mirror
      
      def index
      end

      def new
      end

      def create
      end

      def edit
      end

      def update
      end

      private

      def set_cadastre_mirror
        @cadastre_mirror = Attendance::Enabled::CadastreMirror.find(params[:cadastre_mirror_id])
      end

    end
  end
end