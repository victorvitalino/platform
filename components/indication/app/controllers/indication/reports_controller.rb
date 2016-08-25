require_dependency 'project/application_controller'
module Indication
  class ReportsController < ApplicationController

    def index
      #authorize :report, :index?
      @enterprises = Candidate::EnterpriseCadastre.all
      @enterprises_cadastres = @enterprises.joins(:enterprise)
      @enterprises_count = @enterprises_cadastres.group('project_enterprises.name').count
      @enterprises_inactive_count = @enterprises_cadastres.where(inactive: true).group('project_enterprises.name').count

    end

  end
end
