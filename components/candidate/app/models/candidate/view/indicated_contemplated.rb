module Candidate
  module View
    class IndicatedContemplated < ActiveRecord::Base
      self.table_name = 'indicated_contemplateds'

      belongs_to :cadastre, foreign_key: "cadastre_id", class_name: "Candidate::Cadastre"
      belongs_to :unit, foreign_key: "unit_id", class_name: "Address::Unit"
      belongs_to :enterprise_cadastre, foreign_key: "indication_id", class_name: "Candidate::EnterpriseCadastre"

    end
  end
end
