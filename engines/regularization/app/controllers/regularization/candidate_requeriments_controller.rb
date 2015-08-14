require_dependency 'regularization/application_controller'

module Regularization
  class CandidateRequerimentsController < ApplicationController
    
    def index
      if session[:candidate_id].present?
        @requeriments = Regularization::Requeriment.where(cpf: session[:candidate_id])
      else
        redirect_to action: 'new'
      end
    end

    def new
      @candidate = Regularization::Candidate.new
    end

    def show
      if session[:candidate_id].present?
        @requeriment = Regularization::Requeriment.find(params[:id])
      else
        redirect_to action: 'new'
      end
    end

    def sign_out
      if session[:candidate_id].present?
        session[:candidate_id] = nil
        redirect_to action: 'new'
      end
    end

    def create
      @candidate = Regularization::Candidate.new(set_params)

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