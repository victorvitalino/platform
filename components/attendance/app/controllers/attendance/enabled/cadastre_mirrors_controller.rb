require_dependency 'attendance/application_controller'

module Attendance
  module Enabled
    class CadastreMirrorsController < ApplicationController
    
      def init
        @candidate = Candidate::Cadastre.find_by_cpf(params[:cadastre_mirror_id])
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
      end

    end
  end
end