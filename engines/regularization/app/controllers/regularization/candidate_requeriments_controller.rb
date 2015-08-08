module Regularization
  class CandidateRequerimentsController < ApplicationController
    
    def index
    end

    def new
      @candidate = Regularization::Candidate.new
    end

    def create
      @candidate = Regularization::Candidate.new

      if @candidate.valid?
        session[:candidate_id] = @candidate.id
        redirect_to action: 'index'
      else
        render action: 'new'
      end
    end

    private

    def set_params
      params.require(:candidate).permit(:cpf, :born)
    end
    
  end
end