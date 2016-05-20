require_dependency 'indication/application_controller'

module Indication
  class EnterprisesController < ApplicationController
    
    def index
      @enterprises = Project::Enterprise.all
    end

  end
end
    