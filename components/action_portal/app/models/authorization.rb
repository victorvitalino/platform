module ActionPortal
  class Authorizations
    include ActiveModel::Model

    attr_accessor :password, :id, :cpf
    validates :cpf, cpf: true, presence: true

    validates :password, presence: true

    validate :authenticate

    private

    def authenticate
      @cadastre_user = Action::Cadastre.where(cpf: self.cpf, password: self.password)

      if @cadastre_user.present?
        self.id = @cadastre_user.last.id
      else
        errors.add(:cpf, 'CPF ou Senha inválidos, favor verificar')
      end
    end
  end
end
