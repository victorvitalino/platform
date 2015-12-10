module Regularization
  class Verify
    include ActiveModel::Model 

    attr_accessor :cpf, :id

    validates :cpf, cpf: true, presence: true    


    def record_exists?
      cadastre = Cadastre.find_by_cpf(self.cpf) rescue false
      self.id = cadastre.id if cadastre
    end
  end
end
