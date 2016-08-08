require_dependency 'candidate/application_controller'

module Candidate
  class OcurrencesController < ApplicationController

    # per day
    def index
      @cadastre = Candidate::Cadastre.new
    end

    # per [:cpf, :name]
    def search
      redirect_to action: :index
    end

    # load data of validations of a cpf 
    def validate
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