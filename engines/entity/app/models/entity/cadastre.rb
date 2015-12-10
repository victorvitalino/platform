module Entity
  class Cadastre < ActiveRecord::Base

    belongs_to :city, class_name: "Address::City"
  
    has_many :situations
    has_many :situation_status, through: :situations

    has_many :documents
    has_many :members
    has_many :candidates

    scope :situation, -> (status) {
      Entity::Cadastre.joins(:situations)
      .where('entity_situations.situation_status_id = (SELECT MAX(entity_situations.situation_status_id)
              FROM entity_situations WHERE entity_situations.cadastre_id = entity_cadastres.id)')
      .where('entity_situations.situation_status_id = ?', status)     
    }

=begin 
    attr_accessor :password_confirmation, :current_password, :change_password

    validates :cnpj, cnpj: true, presence: true, uniqueness: true
    validates :name, :fantasy_name,:city, :cep, :address, :complement, :number, presence: true
    validates :email, email: true, presence: true
    validates :telephone, presence: true, numericality: true
    validates :telephone_optional, :celphone, numericality: true, allow_blank: true
    validates :password, :password_confirmation, presence: true, length: { minimum: 6, maximum: 16}, on: :create
    validate  :unique_password, on: :create
    
    validate  :update_password, if: :change_password?

    after_create :set_situation

    private

    def change_password?
      self.change_password.present?
    end

    def update_password
      unless self.password == self.password_confirmation
        errors.add(:password, "senha não confere")
      end

      unless self.current_password == self.password
        errors.add(:current_password, "senha não confere")
      end
    end


    def unique_password
      errors.add(:password, "As senhas não são iguais") unless (self.password == self.password_confirmation)
    end

    def set_situation
    end
=end
  end
end
