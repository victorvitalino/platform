module Regularization
  class Requeriment < ActiveRecord::Base
    belongs_to :unit, class_name: "Address::Unit"
    
    validates :cpf, cpf: true

    enum marital_status: ['união_estável', 'solteiro']
    enum gender: [:masculino, :feminino]

    validates_presence_of :name, :marital_status, :gender, :cpf, :rg, :born, :telephone,:nationality, :email
    
    validates_date :born, before: Time.now - 18.years
    validates :email, email: true

    validates :spouse_cpf, cpf: true, presence: true, if: :union?
    validates :spouse_name, presence: true, if: :union?

    validate :verify_spouse_cpf
    
    validates :cpf, uniqueness: {scope: :unit_id,  message: "Já existe um requerimento neste endereço vínculado a este CPF"}

    def protocol
      "CODHAB#{self.id}#{self.created_at.strftime('%Y')}"
    end

    private

    def union?
      self.marital_status == 'união_estável'
    end

    def verify_spouse_cpf
      errors.add :spouse_cpf, "O CPF do cônjuge deve ser diferente do CPF do solicitante" if self.cpf == self.spouse_cpf 
      
      if Regularization::Requeriment.where(spouse_cpf: self.spouse_cpf) && Regularization::Requeriment.where(cpf: self.spouse_cpf).present?
        errors.add :spouse_cpf, "O CPF do cônjuge já está vínculado a outro requerimento"
      end
    end
  end
end
