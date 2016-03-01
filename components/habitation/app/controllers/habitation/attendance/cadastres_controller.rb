require_dependency 'habitation/application_controller'

module Habitation
  module Attendance
    class CadastresController < ApplicationController
      before_action :set_cadastre, only: [:new]
      before_action :set_cadastre_mirror, except: [:new]

      def new
        if @cadastre.cadastre_mirrors.where(situation: [0,1]).present?
          flash[:danger] = "Já existe uma atualização ativa, favor finaliza-la antes de iniciar outra"
          redirect_to attendance_attendances_path(cpf: @cadastre.cpf)
        else
          @mirror = @cadastre.cadastre_mirrors.new
          @mirror.set_clone(@cadastre.attributes)
          @mirror.save
          @mirror.set_clone_dependent

          redirect_to action: :edit, id: @mirror.id
        end
      end

      def edit

      end

      def update
      end

      private

      def set_params
      end

      def set_cadastre_mirror
        @mirror = Candidate::CadastreMirror.find(params[:id]) rescue nil
      end

      def set_cadastre
        @cadastre = Candidate::Cadastre.find(params[:id]) rescue nil
      end

    end
  end
end