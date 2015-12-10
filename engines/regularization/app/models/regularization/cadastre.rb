module Regularization
  class Cadastre < Candidate::Cadastre
    
    def requeriments; Requeriment.where(cpf: self.cpf); end;
    
    validates :name, :rg, :rg_org, :rg_uf, :gender,
              :born, :born_uf, :place_birth, :civil_state,
              :cep, :city, :address, :income, :special_condition,
              :adapted_property, presence: true
    validates :email, email: true, presence: true
    validates :cpf, cpf: true, uniqueness: true, presence: true
    validates :telephone, presence: true, numericality: true
    validates :celphone, :telephone_optional, numericality: true, allow_blank: true
    
  end
end