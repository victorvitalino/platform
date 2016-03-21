require_dependency 'habitation_portal/application_controller'

module HabitationPortal
  class CandidatesController < ApplicationController

    def find_candidate
      @candidate = Find.new
    end

    def show_candidate
      @candidate = Find.new(set_params_find)

      if @candidate.valid?
        redirect_to action: 'show', id: @candidate.cpf
      else
        render action: 'find_candidate'
      end
    end

    def show
      @candidate = Candidate::Cadastre.by_cpf(params[:id]).first
    end

    def detail
      @candidate = Candidate::Cadastre.by_cpf(params[:candidate_id]).first
    end

    private

    def set_params_find
      params.require(:find).permit(:cpf)
    end

  end
end
