require_dependency 'indication/application_controller'

module Indication
  class CadastresController < ApplicationController
    before_action :set_allotment

    def index
      @cadastres = @allotment.cadastres.all
    end

    private

    def set_allotment
      @allotment  =  Indication::Allotment.find(params[:allotment_id])
    end

  end
end
