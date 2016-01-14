module Candidate
  module View
    class GeneralRegularization < ActiveRecord::Base
      self.table_name = 'general_regularization'

      scope :cpf, -> (cpf) {where(cpf: cpf)}

    end
  end
end