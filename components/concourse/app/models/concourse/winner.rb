module Concourse
  class Winner < ActiveRecord::Base
    belongs_to :participation, class_name: "CandidateParticipation"
    belongs_to :candidate
    belongs_to :project
    belongs_to :subscribe

    enum winner_type: ['menção_honorosa', 'terceiro_lugar', 'segundo_lugar', 'primeiro_lugar']
    
    validate :project_exists?

    def self.winner_custom_types(project_id)
      self.winner_types.map do |k, v|
        [k,v]
      end
    end

    private


    def project_exists?
      @participation = Concourse::CandidateParticipation.find(self.participation_id) rescue nil

      if @participation.nil?
        errors.add(:participation_id, "Projeto não existe") 
      else
        @winner = Concourse::Winner.find_by_participation_id(@participation.id) rescue nil
        errors.add(:participation_id, "Projeto já classificado") if @winner.present?  
      end

      errors.add(:winner_type, 'já noemado') if self.winner_type == nil
    end

  end
end
