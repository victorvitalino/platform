module RegularizationPortal
  class Find
    include ActiveModel::Model

    attr_accessor :cpf

    validates :cpf, cpf: true, presence: true
    validate :cpf_exists?

    private

    def cpf_exists?
      errors.add(:cpf, "CPF não encontrado") unless Candidate::Cadastre.regularization.where(cpf: self.cpf).present?
    end
  end
end