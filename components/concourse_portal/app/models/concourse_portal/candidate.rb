require_dependency 'concourse/candidate'

module ConcoursePortal
  class Candidate < Concourse::Candidate
    attr_accessor :confirmation_password, :current_password, :token
 
    serialize  :properties, Hash 
    validate   :validate_properties

    validates_presence_of :name, :terms_use, :state, :city, :cep, :address, :burgh,  :telephone
    validates :cep, numericality: true, length: { maximum: 8}
    validates :cpf, cpf: true, presence: true, on: :create
    validates_uniqueness_of :cpf, :scope => :subscribe_id, on: :create
    validates_date :born, presence: true
    validates :gender, presence: true 
    validates :rg, presence: true
    validates :password, presence: true, length: { minimum: 4, maximum: 28}

    validates :telephone, numericality: true
    validates :celphone, numericality: true, allow_blank: true
    validates :email, email: true, presence: true
    validates :cnpj, cnpj: true, presence: true

    validates :fantasy_name, :social_reason, presence: true
   
    validates :confirmation_password, presence: true, length: { minimum: 4, maximum: 28}, on: :create
    validate  :compare_password, on: :create
    validate  :unique_cnpj
   #validate  :validate_current_password, on: :create


    
    private

    def unique_cnpj
        if self.changes[:cnpj].present? && self.changes[:cnpj][0] != self.changes[:cnpj][1]
            if ConcoursePortal::Candidate.where(cpf: self.cpf, cnpj: self.cnpj, subscribe_id: self.subscribe_id).present?
                errors.add(:cpnj, 'este CNPJ já se encontra vínculado a uma outra inscrição')
            end
        end
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