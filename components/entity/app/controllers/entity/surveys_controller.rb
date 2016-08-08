require_dependency 'entity/application_controller'
module Entity
  class SurveysController < ApplicationController
    layout 'patternfly/mobile-less-application'

    def index
      if params[:by_cnpj].present? 
        @surveys = Entity::Cadastre.complete.where(cnpj:params[:by_cnpj].to_s.unformat_cnpj)
      elsif params[:by_name].present?
        @surveys = Entity::Cadastre.complete.where("fantasy_name ILIKE '%#{params[:by_name].to_s}%'")
      else
        @surveys = Entity::Cadastre.complete
      end
    end

  end
end
