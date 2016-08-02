require_dependency 'attendance/application_controller'

module Attendance
  module Enabled
    class DependentMirrorsController < ApplicationController
      before_action :set_cadastre_mirror

      def index
      end

      private

      def set_cadastre_mirror
        @cadastre_mirror = Candidate::CadastreMirror.find(params[:cadastre_mirror_id])
      end

    end
  end
end