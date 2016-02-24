require_dependency 'habitation/application_controller'
module Habitation
  class AttendancesController < ApplicationController
    before_action :set_candidate, only: [:new]
    before_action :set_mirror, only: [:update, :edit, :edit_dependent]

    def index
      @candidate = Candidate::Cadastre.find_by_cpf(params[:cpf]) rescue nil
    end

    def new    
      if @candidate.cadastre_mirrors.where(situation: [0,1])
        flash[:danger] = "Já existe uma atualização ativa, favor finaliza-la antes de iniciar outra"
        redirect_to action: :index, cpf: @candidate.cpf
      else
        @mirror = @candidate.cadastre_mirrors.new
        @mirror.set_clone(@candidate.attributes)
        @mirror.save
        @mirror.set_clone_dependents
      end
    end

    def edit
    end

    def update
      if @mirror.update(set_mirror_params)
        flash[:success] = "Cadastro atualizado com sucesso!"
        redirect_to action: :edit_dependent, id: @mirror.id
      else
        render action: :edit
      end
    end


    def edit_dependent

    end

    private

    def set_candidate
      @candidate = Candidate::Cadastre.find(params[:id])
    end

    def set_mirror
      @mirror = Candidate::CadastreMirror.find(params[:id])
    end

    def set_mirror_params
      params.require(:cadastre_mirror).permit(:cpf)
    end
  end
end