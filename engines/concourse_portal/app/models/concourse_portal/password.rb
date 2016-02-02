require_dependency 'concourse/candidate'

module ConcoursePortal
  class Password < Concourse::Candidate

    attr_accessor :confirmation_password, :current_password, :token

    validates :password, presence: true, length: { minimum: 4, maximum: 28}
    validates :confirmation_password, presence: true, length: { minimum: 4, maximum: 28}, on: :create
    
    validate  :compare_password

    validates :current_password, presence: true, if: :token_present?
    validate  :validate_current_password, if: :token_present?
    
    private

    def token_present?
        !self.token.present?
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