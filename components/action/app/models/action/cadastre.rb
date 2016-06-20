module Action
  class Cadastre < ActiveRecord::Base
    belongs_to :city, class_name: "Address::City"
    belongs_to :state, class_name: "Address::State"
    belongs_to :profession
    belongs_to :atuation_area
    belongs_to :formation_area

    attr_accessor :password_confirmation

    validates_presence_of :name, :born, :cpf, :address, :phone, :email
    validates :cpf, cpf: true, uniqueness: true
    validates :email, email: true, uniqueness: true


    validates :password, presence: true,
                    confirmation: true,
                    length: {within: 6..40}


    validate :password_compare

    private

    def password_compare
      unless self.password == self.password_confirmation
        errors.add(:password, "Senha não confere")
      end
    end
  end
end
