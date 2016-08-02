require_dependency 'attendance/application_controller'

module Attendance
  module Enabled
    class CadastreMirrorsController < ApplicationController
      before_action :set_cadastre_mirror, only: [:edit, :update]
      def init
        @candidate = Candidate::Cadastre.find(params[:cadastre_mirror_id])
        @mirror    = Attendance::MirrorService.new 

        
        if @mirror.clone_to_mirror(@candidate.id)
          redirect_to edit_enabled_cadastre_mirror_path(@mirror.mirror_id)
        else
          redirect_to detail_path(@candidate.cpf)
        end
      end

      def edit
      end

      def update
        redirect_to enabled_cadastre_mirror_dependent_mirrors_path(@cadastre_mirror.id)
      end


      private

      def set_cadastre_mirror
        @cadastre_mirror = Candidate::CadastreMirror.find(params[:id])
      end

    end
  end
end