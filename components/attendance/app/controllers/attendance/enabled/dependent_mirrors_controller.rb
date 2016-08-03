require_dependency 'attendance/application_controller'

module Attendance
  module Enabled
    class DependentMirrorsController < ApplicationController
      before_action :set_cadastre_mirror
      before_action :set_dependent_mirror, only: [:edit, :update, :destroy]

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

      def set_cadastre_mirror
        @cadastre_mirror = Attendance::Enabled::CadastreMirror.find(params[:cadastre_mirror_id])
      end

      def set_params
        params.require(:dependent_mirror).permit(:born, :special_condition_id, :cid, :co_acquirer,
                                                 :cpf, :rg, :rg_org, :name, :gender, :civil_state_id, 
                                                 :kinship_id, :income, :nis, :percentage)

      end

      def set_dependent_mirror
        @dependent_mirror = @cadastre_mirror.dependent_mirrors.find(params[:id])
      end

    end
  end
end