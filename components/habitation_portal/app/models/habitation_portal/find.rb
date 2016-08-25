module HabitationPortal
  class Find
    include ActiveModel::Model

    attr_accessor :cpf, :id

    validates :cpf, cpf: true, presence: true
    validate  :cpf_exists?

    private

    def cpf_exists?
      cpf = Candidate::Cadastre.habitation.where(cpf: self.cpf)

      if cpf.present?
        self.id = cpf.first.id 
      else 
        errors.add(:cpf, "CPF não encontrado") 
      end

    end
  end
end