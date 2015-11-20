module Candidate
  module View
    class GeneralPontuation < ActiveRecord::Base
      self.table_name = 'general_pontuations'

      scope :by_income, -> (started_at = 0, ended_at = 1600) { where(income: started_at..ended_at) }
      scope :cpf, -> (cpf) {where(cpf: cpf)}

      def self.paginate
        self
      end
    end
  end
end