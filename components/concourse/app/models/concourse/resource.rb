module Concourse
  class Resource < ActiveRecord::Base
    belongs_to :project
    belongs_to :candidate

    attr_accessor :password

    enum situation: ['processando', 'analisada']

    validates :candidate_id, :password, :message, presence: true

    validate :unique_resource
    validate :credential_valid?

    private

    def unique_resource
      if Concourse::Resource.where(candidate_id: self.candidate_id).present?
        errors.add(:candidate_id, "Nº de inscrição já enviou recurso, aguarde análise e a resposta.")
      end
    end

    def credential_valid?
      candidate     = self.project.candidates.find(self.candidate_id) rescue nil
      participation = Concourse::CandidateParticipation.find_by_candidate_id(self.candidate_id) rescue nil 

      if candidate.present? && participation.present?
        if candidate.password != self.password
          errors.add(:candidate_id, "Nº de inscrição ou senha não conferem")
        end
      else
        errors.add(:candidate_id, "Nº de inscrição não pertence a este concurso ou não enviou o projeto")
      end
    end 
  end
end