module Concourse
  class ParticipationCandidate < ActiveRecord::Base
    belongs_to :participation
    belongs_to :candidate
    belongs_to :project
  end
end
