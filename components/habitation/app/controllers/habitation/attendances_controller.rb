require_dependency 'habitation/application_controller'
module Habitation
  class AttendancesController < ApplicationController
    before_action :set_candidate, only: [:new_cadastre]
    before_action :set_mirror, except: [:index]

    def index
      @candidate = Candidate::Cadastre.find_by_cpf(params[:cpf]) rescue nil
    end

    ################# GENERAL CADASTRE #####################
    
    def new_cadastre   
      if @candidate.cadastre_mirrors.where(situation: [0,1]).present?
        flash[:danger] = "Já existe uma atualização ativa, favor finaliza-la antes de iniciar outra"
        redirect_to action: :index, cpf: @candidate.cpf
      else
        @mirror = @candidate.cadastre_mirrors.new
        @mirror.set_clone(@candidate.attributes)
        @mirror.save
        @mirror.set_clone_dependent

        redirect_to action: :edit_cadastre, id: @mirror.id
      end
    end

    def edit_cadastre
    end

    def update_cadastre
      if @mirror.update(set_mirror_params)
        flash[:success] = "Cadastro atualizado com sucesso!"
        redirect_to action: :index_dependent, id: @mirror.id
      else
        render action: :edit_cadastre
      end
    end

    def destroy_cadastre
      if @mirror.destroy
        redirect_to action: :index, cpf: @mirror.cpf 
      else
        flash[:danger] = 'Não foi possível excluir'
        render action: :destroy_cadastre
      end
    end

    ################# DEPENDENTS #####################
    
    def index_dependent
    end

    def new_dependent
      @dependent = @mirror.dependent_mirrors.new
    end

    def create_dependent
      @dependent = @mirror.dependent_mirrors.new(set_dependent_params)
      @dependent.save
    end


    def edit_dependent
      @dependent = @mirror.dependent_mirrors.find(params[:dependent_id])
    end

    def update_dependent
      @dependent = @mirror.dependent_mirrors.find(params[:dependent_id])
      @dependent.update(set_dependent_params)
    end
    
    def destroy_dependent
      @dependent = @mirror.dependent_mirrors.find(params[:dependent_id])
      @dependent.destroy
    end

    ################# CHECKLIST #####################

    def checklist
    end

    def update_checklist
    end


    ################# FINISH #######################

    def finish
    end

    def check_supervisor
    end

    def check
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

    def set_dependent_params
      params.require(:dependent_mirror).permit(:cpf, :rg, :rg_org, :name, :born, :gender, :civil_state_id,
                                               :kinship_id, :income, :special_condition_id, :nis, :cid, 
                                               :co_acquirer, :percentage)
    end
  end
end