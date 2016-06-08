module Candidate
  class EnterpriseCadastreSituation < ActiveRecord::Base
    belongs_to :enterprise_situation_status, foreign_key: "enterprise_cadastre_status_id"
    belongs_to :enterprise_cadastre, class_name: "Candidate::EnterpriseCadastre"


  end
end
