module Schedule
  class Verification 
    include ActiveModel::Model

    attr_accessor :cpf, :born, :name, :telephone, :email

    validates :cpf, cpf: true, presence: true
    validates_date :born, presence: true
    validates :email, email: true, presence: true

    validate :valid!, if: :born?

    private

    def born?
      self.born.present?
    end

    def valid!
      if !Schedule::AgendaSchedule.where(cpf: self.cpf, born: Date.parse(self.born)).present?
        errors.add(:cpf, 'Os dados informados não conforem com os vínculados a este CPF')
      end
    end
  end
end