require_dependency 'candidate/application_controller'

module Candidate
  class OcurrencesController < ApplicationController

    # per day
    def index
      @cadastre = Candidate::Cadastre.new
    end

    # per [:cpf, :name]
    def detail

      @cadastre = Candidate::Cadastre.find_by_cpf(params[:cpf].unformat_cpf) rescue nil
     
      if !@cadastre.present?
        flash[:danger] = "CPF não foi encontrado"
        redirect_to ocurrences_path(cpf: params[:cpf]) 
      end
    end

    # load data of validations of a cpf 
    def verify
      @cadastre  = Candidate::Cadastre.find_by_cpf(params[:cpf].unformat_cpf) rescue nil

      if @cadastre.nil?
        flash[:danger] = t(:danger)
      else
        Candidate::VerifyService.new(@cadastre).update_ocurrences!
        flash[:success] =  t(:success)
      end
      
      redirect_to detail_ocurrences_path(cpf: params[:cpf])
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