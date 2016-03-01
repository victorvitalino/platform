module Candidate
  module View
    class GeneralRegularization < ActiveRecord::Base
      self.table_name = 'general_regularization'

      scope :cpf, -> (cpf) {where(cpf: cpf)}

      belongs_to :cadastre, foreign_key: "id", class_name: "Candidate::Cadastre"

    end
  end
end