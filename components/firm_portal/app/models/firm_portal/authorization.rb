module FirmPortal
  class Authorization
    include ActiveModel::Model

    attr_accessor :login_user, :password, :id

    validates :login_user,  presence: true
    validates :password, presence: true

    validate :authenticate

    private

    def authenticate
      @firm = Firm::UserCompany.where(login_user: self.login_user, password: self.password, status: true)

      if @firm.present?
        self.id = @firm.last.id
      else
        errors.add(:login_user, 'Login ou Senha inválidos, favor verificar')
      end
    end
  end
end
