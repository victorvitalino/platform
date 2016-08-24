module Candidate
  module View
    class IndicatedContemplated < ActiveRecord::Base
      self.table_name = 'indicated_contemplateds'

      belongs_to :cadastre, primary_key: :id, foreign_key: :cadastre_id,  class_name: "Candidate::Cadastre"
      belongs_to :unit, primary_key: :unit_id, foreign_key: :id, class_name: "Address::Unit"
      belongs_to :enterprise_cadastre,foreign_key: :indication_id,  primary_key: :id,  class_name: "Candidate::EnterpriseCadastre"

      scope :per_enterprise, -> (id) { where(project_enterprise_id: id, situation_status_id: [7,44], situation_id: 1) }

    end
  end
end
