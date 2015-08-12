module Regularization
  class Candidate
    include ActiveModel::Model

    attr_accessor :id, :cpf, :born

    validates_date :born, presence: true
    validates :cpf, cpf: true, presence: true
    validate :requeriment_valid?

    private

    def requeriment_valid?
      unless Regularization::Requeriment.where(cpf: self.cpf, born: self.born).present?
        errors.add :cpf, 'cpf ou data de nascimento inválida'
      else
        self.id = self.cpf
      end
    end
  end
end