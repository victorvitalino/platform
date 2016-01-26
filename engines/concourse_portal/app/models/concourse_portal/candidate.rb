require_dependency 'concourse/candidate'

module ConcoursePortal
  class Candidate < Concourse::Candidate
    attr_accessor :confirmation_password, :current_password, :token
 
    serialize  :properties, Hash 
    validate   :validate_properties

    validates_presence_of :name, :terms_use, :state, :city, :cep, :address, :burgh,  :telephone
    validates :cep, numericality: true, length: { maximum: 8}
    validates :cpf, cpf: true, presence: true
    validates_uniqueness_of :cpf, :scope => :subscribe_id, on: :create

    validates :password, presence: true, length: { minimum: 4, maximum: 28}
    validates :confirmation_password, presence: true, length: { minimum: 4, maximum: 28}

    validates :telephone, numericality: true
    validates :celphone, numericality: true, allow_blank: true
    validates :email, email: true, presence: true
    validates :cnpj, cnpj: true, presence: true
    validates :fantasy_name, :social_reason, presence: true
   
    validate  :compare_password
    validate  :validate_current_password, on: :update, if: :token_present?


    
    private

    def token_present?
        !self.token.present?
    end

    def validate_properties
      subscribe.fields.each do |field|
        errors.add :"#{field.label}", "não pode ficar em branco" if field.required && self.properties[field.label].blank?
      end
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