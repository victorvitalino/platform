module Entity
  class Cadastre < ActiveRecord::Base

    belongs_to :city, class_name: "Address::City"

    attr_accessor :password_confirmation

    validates :cnpj, cnpj: true, presence: true, uniqueness: true
    validates :name, :fantasy_name,:city, :cep, :address, :complement, :number, presence: true
    validates :email, email: true, presence: true, uniqueness: true
    validates :telephone, presence: true, numericality: true
    validates :telephone_optional, :celphone, numericality: true, allow_blank: true
    validates :password, :password_confirmation, presence: true, length: { minimum: 6, maximum: 16}
    validate  :unique_password
    
    after_create :set_situation

    private

    def unique_password
      errors.add(:password, "As senhas não são iguais") unless (self.password == self.password_confirmation)
    end

    def set_situation
    end
  end
end
