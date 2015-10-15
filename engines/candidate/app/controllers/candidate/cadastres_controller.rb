require_dependency 'candidate/application_controller'

module Candidate
  class CadastresController < ApplicationController


    def index
      @cadastre = Cadastre.by_cpf(params[:cpf]).first
    end

  end
end