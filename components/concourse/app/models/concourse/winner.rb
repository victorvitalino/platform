module Concourse
  class Winner < ActiveRecord::Base
    belongs_to :participation, class_name: "CandidateParticipation"
    belongs_to :candidate
    belongs_to :project
    belongs_to :subscribe

    audited 
    
    enum winner_type: ['menção_honrosa', 'terceiro_lugar', 'segundo_lugar', 'primeiro_lugar']
    
    validate :project_exists?
    validate :position?

    def self.winner_custom_types(project_id)
      @keys = Array.new
      
      self.winner_types.map do |key, value|
        winner = Concourse::Winner.where(project_id: project_id, winner_type: value)

        @keys.push key if !winner.present? || value == 0
      end
      
      @keys
    end

    private

    def position?
      type = Concourse::Winner.winner_types[self.winner_type]
      return true if type == 0
      
      @position = Concourse::Winner.where(project_id: self.project_id, winner_type: type)
      errors.add(:winner_type, 'Já noemado um candidato para essa posição') if @position.present?
    end

    def project_exists? 
      @project = Concourse::Project.find(self.project_id) rescue nil
      @participation  = @project.candidate_participations.find(self.participation_id) rescue nil

      if @participation.nil?
        errors.add(:participation_id, "Projeto não existe") 
      else
        @winner = Concourse::Winner.find_by_participation_id(@participation.id) rescue nil
        errors.add(:participation_id, "Projeto já classificado") if @winner.present?  
      end

      errors.add(:winner_type, 'já nomeado') if self.winner_type == nil
    end

  end
end
