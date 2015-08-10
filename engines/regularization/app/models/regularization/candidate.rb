module Regularization
  class Candidate
    include ActiveModel::Model

    attr_accessor :id, :cpf, :born


    validates_date :born, presence: true
    validates :cpf, cpf: true, presence: true

  end
end