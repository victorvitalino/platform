require_dependency 'entity/application_controller'
module Entity
  class SurveysController < ApplicationController
    layout 'patternfly/mobile-less-application'

  def index
    if params[:by_cnpj].present?
      @surveys = Entity::Cadastre.where(cnpj:params[:by_cnpj].to_s.unformat_cnpj)
    else
      @surveys = Entity::Cadastre.all
    end
  end

  end
end
