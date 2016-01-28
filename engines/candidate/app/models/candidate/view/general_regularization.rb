module Candidate
  module View
    class GeneralRegularization < ActiveRecord::Base
      self.table_name = 'general_regularization'

      belongs_to :procedural_status, class_name: "Candidate::ProceduralStatus"
      scope :cpf, -> (cpf) {where(cpf: cpf)}
      scope :convocation, -> (convocation_id) { where(conv_id: convocation_id)}

    end
  end
end