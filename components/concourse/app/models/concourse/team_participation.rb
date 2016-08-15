module Concourse
  class TeamParticipation < ActiveRecord::Base
    belongs_to :candidate_participation

    enum job: ['co-autor','colaborador','consultor']

    validates :name, :job, presence: true

  end
end
