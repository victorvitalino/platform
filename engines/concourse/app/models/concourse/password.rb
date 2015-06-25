module Concourse
  class Password
    include ActiveModel::Model

    attr_accessor :old_password, :new_password, :confirmation_password, :candidate

    validates_presence_of :old_password, :new_password, :confirmation_password
    validates_length_of  :new_password, :confirmation_password, in: 6..40
    validate :old_password_valid?
    validate :equal_password

    def set_candidate(candidate_id)
      @candidate = Candidate.find(candidate_id)
    end

    def update_candidate
      @candidate.update(password: self.new_password)
    end

    private

    def old_password_valid?
      errors.add(:old_password, 'Senha não confere') unless @candidate.password == self.old_password
    end

    def equal_password
      errors.add(:new_password, "Senhas não conferem") unless self.new_password == self.confirmation_password
    end
  end
end