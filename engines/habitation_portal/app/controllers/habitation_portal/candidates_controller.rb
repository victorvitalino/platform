require_dependency 'habitation_portal/application_controller'

module HabitationPortal
  class CandidatesController < ApplicationController 
    
    def show
      @candidate = Candidate::Cadastre.by_cpf(params[:id]).first
    end

  end
end 
