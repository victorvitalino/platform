module ProfileUser
  class Password
    include ActiveModel::Model

    attr_accessor :password, :password_confirmation, :current_password, :id

    validates :password, :password_confirmation, :current_password, presence:  true
    validate :compare_password
    validate :current_password_valid?
    
    def set_user(user)
      self.id = user.id
    end

    def update_password
      staff = Person::Staff.find(self.id)
      staff.password = self.password
      staff.save
    end

    private

    def compare_password
      if self.password != self.password_confirmation
        errors.add(:password, 'As senha não são iguais')
      end
    end

    def current_password_valid?
      staff = Person::Staff.find(self.id)

      if self.current_password != staff.password 
        errors.add(:current_password, 'A senha atual está incorreta')
      end
    end
  end
end