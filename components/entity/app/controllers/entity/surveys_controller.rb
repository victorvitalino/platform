require_dependency 'entity/application_controller'
module Entity
  class SurveysController < ApplicationController
    layout 'patternfly/mobile-less-application'

  def index
    @surveys = Entity::Cadastre.all
  end
end
end
