module Schedule
  class Verification 
    include ActiveModel::Model

    attr_accessor :cpf, :born, :name, :telephone, :email

    validates :cpf, cpf: true, presence: true
    validates :born, presence: true
    validates :telephone, numericality: true, presence: true
    validates :email, email: true, presence: true

    validate :valid!

    private

    def valid!
      if !Schedule::AgendaSchedule.where(cpf: self.cpf, born: self.born, email: self.email).present?
        errors.add(:cpf, 'Os dados informados não conforem com os vínculados a este CPF')
      end
    end
  end
end