require_dependency 'regularization/application_controller'

module Regularization
  class CandidateRequerimentsController < ApplicationController
    before_action :validate_session_candidate, only: [:show, :sign_out]
    before_action :redirect_session_candidate, only: [:show]
    def index
      @requeriments = Regularization::Requeriment.where(cpf: session[:candidate_id])
    end

    def new
      session[:cpf]           = nil
      session[:candidate_id]  = nil

      @candidate = Regularization::Candidate.new
    end

    def show
      @requeriment = Regularization::Requeriment.find(params[:id])
    end

    def sign_out
      session[:candidate_id] = nil
      redirect_to action: 'new'
    end

    def create
      @candidate = Regularization::Candidate.new(set_params)

      if @candidate.valid?
        session[:candidate_id] = @candidate.id
        session[:cpf]          = @candidate.cpf
        redirect_to action: 'index'
      else
        render action: 'new'
      end
    end

    private

    def set_params
      params.require(:candidate).permit(:cpf, :born)
    end

    def validate_session_candidate
      redirect_to action: 'new' unless session[:cadidate_id].present?
    end

    def redirect_session_candidate
      redirect_to action: 'index' if session[:candidate_id].present?
    end

    
  end
end