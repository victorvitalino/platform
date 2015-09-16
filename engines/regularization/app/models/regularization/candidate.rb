module Regularization
  class Candidate
    include ActiveModel::Model

    attr_accessor :id, :cpf, :born

    validates_presence_of :born, :cpf

    validates_date :born
    validates :cpf, cpf: true
    
    validate :requeriment_valid?, if: :field_presence?

    private

    def requeriment_valid?
      unless Regularization::Requeriment.where(cpf: self.cpf, born: Date.parse(self.born).strftime('%Y-%m-%d')).present?
        errors.add :cpf, 'CPF ou data de nascimento não encontrado. Verifique.'
      else
        self.id = self.cpf
      end
    end

    def field_presence?
      self.cpf.present? && self.born.present?
    end
  end
end