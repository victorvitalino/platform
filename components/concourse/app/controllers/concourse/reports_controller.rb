require_dependency 'concourse/application_controller'

module Concourse
  class ReportsController < ApplicationController
    layout 'patternfly/application'
    
    def index

      authorize :report, :index?

      @candidates       = Concourse::Candidate.all
      
      @count_candidates = @candidates.count 
      @per_state        = Concourse::Candidate.joins(:state).group('address_states.name').count
      @per_concourse    = Concourse::Candidate.joins(:subscribe).joins('INNER JOIN concourse_projects
                                                                        ON concourse_projects.id = concourse_subscribes.project_id')
                                                                .group('concourse_projects.title').count
      
    end

  end
end