module Concourse
  class Session
    include ActiveModel::Model

    attr_accessor :cpf, :password, :candidate

    validates :cpf, presence: true, cpf: true
    validates :password, presence: true
    
    validate :is_valid?

    def candidate
      @candidate.last.id
    end

    private

    def is_valid?
      @candidate = Concourse::Candidate.where(cpf: self.cpf, password: self.password)
      errors.add(:cpf, 'CPF ou Senha estão incorretos') if !@candidate.present?
    end


  end
end