require_dependency 'regularization_portal/application_controller'

module RegularizationPortal
  class CadastresController < ApplicationController 
    
    def show
      @candidate = Candidate::Cadastre.find_by_cpf(params[:id])
    end

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

    private

    def set_params_find
      params.require(:find).permit(:cpf)
    end

    
  end
end