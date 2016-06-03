module Action
  class Cadastre < ActiveRecord::Base
    belongs_to :city
    belongs_to :state, class_name: "Address::State"
    belongs_to :profession
    belongs_to :atuation_area
    belongs_to :formation_area

    validates_presence_of :name, :born, :cpf, :address, :phone, :email
    validates :cpf, numericality: true
    validates :email, uniqueness: true
    validates :email,format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

    validates :password, presence: true,
                    confirmation: true,
                    length: {within: 6..40}
  end
end
