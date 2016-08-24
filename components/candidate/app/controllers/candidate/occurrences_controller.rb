require_dependency 'candidate/application_controller'

module Candidate
  class OccurrencesController < ApplicationController

    # per day
    def index
      @cadastre = Candidate::Cadastre.find_by_cpf(params[:cpf].unformat_cpf) rescue nil
    end

    # load data of validations of a cpf 
    def verify
      @cadastre  = Candidate::Cadastre.find_by_cpf(params[:occurrence_id]) rescue nil

      if @cadastre.nil?
        flash[:danger] = t(:danger)
      else
        Candidate::VerifyService.new(@cadastre).update_ocurrences!
        flash[:success] =  t(:success)
      end
      
      redirect_to occurrences_path(cpf: params[:occurrence_id].to_s.format_cpf)
    end

    def new
    end

    def create
    end

    def edit
    end

    def update
    end

    private

    def set_params
    end

    def set_cadastre
    end

  end
end