module EntityPortal
  class Authorization 
    include ActiveModel::Model

    attr_accessor :cnpj, :password, :id

    validates :cnpj, cnpj: true, presence: true
    validates :password, presence: true

    validate :authenticate

    private

    def authenticate
      @entity = Entity::Cadastre.where(cnpj: self.cnpj, password: self.password)
      
      if @entity.present? 
        self.id = @entity.last.id
      else
        errors.add(:cnpj, 'CNPJ ou Senha inválidos, favor verificar')
      end
    end
  end
end