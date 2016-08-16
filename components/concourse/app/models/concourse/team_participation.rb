module Concourse
  class TeamParticipation < ActiveRecord::Base
    belongs_to :candidate_participation

    
    
    enum job: ['co-autor','colaborador','consultor', 'outro']

    validates :name, :job, presence: true

  end
end
