module Concourse
  class Candidate < ActiveRecord::Base
    belongs_to :state, class_name: "Address::State"
    belongs_to :subscribe
    
    attr_accessor :confirmation_password, :current_password
    
    enum gender: [:masculino, :feminino]
    enum status: [:processando, :homologado, :indeferido]
    
    serialize  :properties, Hash 
    validate   :validate_properties

    validates_presence_of :name, :terms_use, :state, :city, :cep, :address, :burgh,  :telephone
    validates :cpf, cpf: true, presence: true
    validates_uniqueness_of :cpf, :scope => :subscribe_id, on: :create

    validates :password, presence: true, length: { minimum: 6, maximum: 8}
    validates :confirmation_password, presence: true, length: { minimum: 6, maximum: 8}

    validates :telephone, numericality: true
    validates :celphone, numericality: true, allow_blank: true
    validates :email, email: true, presence: true
    validates :cnpj, cnpj: true, presence: true, if: :juridical_person?
    validates :current_password, presence: true, on: :update
   
    validate  :compare_password
    validate  :validate_current_password, on: :update


    def paid?
        type = self.subscribe.type_guide.id
        cpf  = self.cpf

        Finance::PaymentGuide.where(type_guide_id: type, cpf: cpf, status: true).present?
    end

    def protocol_number
        "#{self.id}#{self.created_at.strftime("%Y")}"
    end
    
    private

    def validate_properties
      subscribe.fields.each do |field|
        errors.add :"#{field.label}", "não pode ficar em branco" if field.required && self.properties[field.label].blank?
      end
    end

    def juridical_person?
      self.fantasy_name.present?
    end

    def compare_password
      errors.add(:confirmation_password, 'senha não confere') unless self.password == self.confirmation_password
    end

    def validate_current_password
        @candidate = Concourse::Candidate.find(self.id)
        errors.add(:current_password, 'senha não coincide com a senha atual') if @candidate.password != self.current_password
    end
  end
end
