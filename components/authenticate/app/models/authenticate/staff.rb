module Authenticate
  class Staff
    include ActiveModel::Model

    attr_accessor :code, :password, :id

    validates :code, :password, presence: true 
    validate  :validate_credentials!

    private

    def validate_credentials!
      @staff = Person::Staff.where(code: self.code, password: self.password).first

      if @staff.present?
        self.id = @staff.id
      else
        errors.add(:code, 'usuário ou senha não conferem')
      end
    end
  end
end