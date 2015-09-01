module RegularizationTreatment
  class Consult
    include ActiveModel::Model

    attr_accessor :cpf, :name

    validates :cpf, cpf: true, presence: true

  end
end
