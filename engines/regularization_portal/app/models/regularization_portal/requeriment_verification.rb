module RegularizationPortal
  class RequerimentVerification 
    include ActiveModel::Model 

    attr_accessor :cpf, :born, :id, :requeriment


    validates :cpf, cpf: true, presence: true
    validates_date :born, presence: true

    validate :candidate_exists?

    def first
      self.requeriment
    end

    private

    def candidate_exists?
      if self.cpf.present? && self.born.present?
        self.requeriment = Regularization::Requeriment.where(cpf: self.cpf, born: self.born).first
        errors.add(:cpf, 'não existem requerimentos vínculado aos dados informados') if !self.requeriment.present?
      end
    end
  end
end