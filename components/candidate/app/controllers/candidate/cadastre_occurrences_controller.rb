require_dependency 'candidate/application_controller'

module Candidate
  class CadastreOccurrencesController < ApplicationController
    before_action :set_cadastre

    # per day
    def index
      Candidate::CreateOccurrenceService.new(@cadastre).create!
    end

    private

    def set_cadastre
      @cadastre = Candidate::Cadastre.find(params[:cadastre_id])
    end

  end
end