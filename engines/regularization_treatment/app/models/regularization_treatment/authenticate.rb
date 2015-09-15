module RegularizationTreatment
  class Authenticate

    include ActiveModel::Model

    attr_accessor :id, :login, :password, :procedural_status, :description

    validates :login, :password, :procedural_status, :description, presence: true

    validate :login?

    def procedural_status
        @procedural_status = Candidate::ProceduralStatus.all
    end

    def login?
        user = User.find_by_username(self.login)
        if user.present? && user.account.attendant.present? && user.account.attendant.id != self.id
           errors.add(:login, "Você não é attendant")  unless user.valid_password?(self.password)  && user.account.attendant.supervisor
        else
            errors.add(:login, "usuário ou senha inválidos")
        end

    end

  end
end