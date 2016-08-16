require_dependency 'candidate/application_controller'

module Candidate
  class CadastresController < ApplicationController

    before_action :set_cadastre, only: [:cadastre_situation, :cadastre_procedural]
    def index
      authorize :cadastre, :index?
=begin 
      @candidate = Cadastre.find_by_cpf(params[:cpf]) rescue nil
      @iptu = Candidate::Iptu.where(cpf: params[:cpf]) rescue nil
      document_number = @candidate.cadastre_procedurals.last.old_process if @candidate.present? && @candidate.cadastre_procedurals.present?
      @candidate_assessment = Protocol::Assessment.where("document_number = ? or cpf = ? ",document_number,params[:cpf]) rescue nil
      unless params[:cpf].nil?
       flash[:warning] = "O CPF: <b>#{params[:cpf]}</b> não foi encontrado.".html_safe if @candidate.nil?
      end
=end

      @cadastre = Candidate::SearchCadastreService.new(params).search!
    end

    def occurrence
    end

    def edit
      authorize :cadastre, :update?
      @candidate = Cadastre.find(params[:id])
    end

    def cadastre_situation
      authorize :cadastre, :update_situation?
      @cadastre_situation = Candidate::CadastreSituation.new
    end

    def cadastre_situation_create
      authorize :cadastre, :update_situation?
      @cadastre_situation = Candidate::CadastreSituation.new(set_cadastre_situation_params)
      @cadastre_situation.cadastre_mirror_id = @cadastre_situation.cadastre_id
      @cadastre_situation.save

      flash[:success] = "Situação alterada com sucesso."

      redirect_to cadastres_path(cpf: @cadastre_situation.cadastre.cpf)

    end

    def cadastre_procedural
      authorize :cadastre, :update_procedural?
      @cadastre_procedural = Candidate::CadastreProcedural.new
    end

    def cadastre_procedural_create
      authorize :cadastre, :update_procedural?
      @cadastre_procedural = Candidate::CadastreProcedural.new(set_cadastre_procedural_params)
      @cadastre_procedural.staff_id = current_user.id
      @cadastre_procedural.save

      Candidate::CadastreActivity.create_simple_log!({cadastre_id: @cadastre_procedural.cadastre_id,
        staff_id: current_user.id, activity_status_id: 9, type_activity: 2,status: true, type_ocurrency: 1,
        observation: @cadastre_procedural.observation })

      flash[:success] = "Situação processual alterada com sucesso."

      redirect_to cadastres_path(cpf: @cadastre_procedural.cadastre.cpf)

    end



    private



     def set_cadastre
       @candidate = Cadastre.find(params[:cadastre_id])
     end

     def set_cadastre_situation_params
         params.require(:cadastre_situation).permit(:cadastre_id, :situation_status_id)
     end

     def set_cadastre_procedural_params
         params.require(:cadastre_procedural).permit(:cadastre_id, :procedural_status_id, :convocation_id, :assessment_id, :old_process, :observation)
     end

  end
end
