require_dependency 'candidate/application_controller'

module Candidate
  class CadastresController < ApplicationController


    def index
      @candidate = Cadastre.find_by_cpf(params[:cpf]) rescue nil
    end

  end
end