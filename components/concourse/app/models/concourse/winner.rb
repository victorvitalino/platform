module Concourse
  class Winner < ActiveRecord::Base
    belongs_to :participation, class_name: "CandidateParticipation"
    belongs_to :candidate
    belongs_to :project
    belongs_to :subscribe

    enum winner_type: ['menção_honorosa', 'terceiro_lugar', 'segundo_lugar', 'primeiro_lugar']
    
    validates :participation, presence: true
    validates_uniqueness_of :participation, scope: :project 
  end
end
