require_dependency 'candidate/application_controller'

module Candidate
  class CadastresController < ApplicationController


    def index
      authorize :cadastre, :index?

      @candidate = Cadastre.find_by_cpf(params[:cpf]) rescue nil
      @iptu = Candidate::Iptu.where(cpf: params[:cpf]) rescue nil
      unless params[:cpf].nil?
       flash[:warning] = "O CPF: <b>#{params[:cpf]}</b> não foi encontrado.".html_safe if @candidate.nil?
      end

    end

    def edit
      authorize :cadastre, :update?
      @candidate = Cadastre.find(params[:id])
    end

    def cadastre_situation
      authorize :cadastre, :update_situation?
      @cadastre_situation = Candidate::CadastreSituation.new
      @candidate = Cadastre.find(params[:cadastre_id])

    end

    def cadastre_situation_create
      authorize :cadastre, :update_situation?
      @cadastre_situation = Candidate::CadastreSituation.new(set_cadastre_situation)
      @cadastre_situation.cadastre_mirror_id = @cadastre_situation.cadastre_id
      @cadastre_situation.save

      flash[:success] = "Situação alterada com sucesso."

      redirect_to cadastres_path(cpf: @cadastre_situation.cadastre.cpf)

    end

    def cadastre_procedural
      authorize :cadastre, :update_procedural?
      @cadastre_procedural = Candidate::CadastreProcedural.new
      @candidate = Cadastre.find(params[:cadastre_id])

    end

    def cadastre_procedural_create
      authorize :cadastre, :update_procedural?
      @cadastre_procedural = Candidate::CadastreProcedural.new(set_cadastre_procedural)
      @cadastre_procedural.cadastre_mirror_id = @cadastre_procedural.cadastre_id
      @cadastre_procedural.save

      flash[:success] = "Situação processual alterada com sucesso."

      redirect_to cadastres_path(cpf: @cadastre_procedural.cadastre.cpf)

    end



    private

    def set_cadastre_situation
                params.require(:cadastre_situation).permit(:cadastre_id, :situation_status_id)
    end

    def set_cadastre_procedural
                params.require(:cadastre_procedural).permit(:cadastre_id, :procedural_status_id, :convocation_id, :assessment_id, :old_process)
    end

  end
end
