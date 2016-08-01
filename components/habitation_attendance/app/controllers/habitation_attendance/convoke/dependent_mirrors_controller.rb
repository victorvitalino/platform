require_dependency 'habitation_attendance/application_controller'

module HabitationAttendance
  module Convoke
    class DependentMirrorsController < ApplicationController
     
      before_action :set_mirror
      before_action :set_dependent, only: [:edit, :update, :destroy]

      def index
      end

      def new
        @dependent_mirror = @cadastre_mirror.dependent_mirrors.new
      end

      def create
        @dependent_mirror = @cadastre_mirror.dependent_mirrors.new(set_params)
        @dependent_mirror.save
      end

      def edit
      end

      def update
        @dependent_mirror.update(set_params)
      end

      def destroy
        @dependent_mirror.destroy
      end

      private

      def set_dependent
        @dependent_mirror = @cadastre_mirror.dependent_mirrors.find(params[:id])
      end

      def set_mirror
        @cadastre_mirror = Candidate::CadastreMirror.find(params[:cadastre_mirror_id])
      end

      def set_params
        params.require(:dependent_mirror).permit(:name)
      end
    end
  end
end