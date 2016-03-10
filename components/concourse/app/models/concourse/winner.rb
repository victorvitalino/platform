module Concourse
  class Winner < ActiveRecord::Base
    belongs_to :participation, class_name: "CandidateParticipation"
    belongs_to :candidate
    belongs_to :project
    belongs_to :subscribe

    enum winner_type: ['menção_honorosa', 'terceiro_lugar', 'segundo_lugar', 'primeiro_lugar']
    
    validates :participation, presence: true
    validates_uniqueness_of :participation, scope: :project 
    validate :project_exists?

    private

    def project_exists?
      @participation = Concourse::CandidateParticipation.find(self.participation_id) rescue nil

      errors.add(:participation_id, "Projeto não existe") if @participation.nil?
    end
  end
end
