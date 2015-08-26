module Concourse
  class Candidate < ActiveRecord::Base
    belongs_to :state, class_name: "Address::State"

    attr_accessor :confirmation_password

    enum gender: [:masculino, :feminino]
    enum status: [:processando, :homologado, :indeferido]

    validates_presence_of :name, :terms_use, :state, :city, :cep, :address, :burgh,  :telephone

    validates :cpf, cpf: true, presence: true
    validates_uniqueness_of :cpf, :scope => :subscribe_id

    validates :password, presence: true, length: { minimum: 6, maximum: 8}
    validates :confirmation_password, presence: true, length: { minimum: 6, maximum: 8}

    validates :telephone, numericality: true
    validates :celphone, numericality: true, allow_blank: true
    validates :email, email: true, presence: true
    validates :cnpj, cnpj: true, presence: true, if: :juridical_person?
    
    validate :compare_password

    def protocol
      "CODHAB#{self.id}#{self.created_at.strftime('%Y')}"
    end

    private

    def juridical_person?
      self.fantasy_name.present?
    end

    def compare_password
      errors.add(:confirmation_password, 'senha não confere') unless self.password == self.confirmation_password
    end
  end
end
