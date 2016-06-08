module Firm
  module View
    class FirmCadastre < ActiveRecord::Base
      self.table_name = 'firm_cadastres'

      scope :cpf, -> (cpf) {where(cpf: cpf)}
      scope :status, -> (status) {where(enterprise_cadastre_status_id: status)}
      scope :name_candidate, -> (name_candidate) {where("name LIKE ? ", "#{name_candidate}%")}

      belongs_to :cadastre, class_name: "Candidate::Cadastre", foreign_key: "cadastre_id"
      belongs_to :enterprise, class_name: "Project::Enterprise", foreign_key: "enterprise_id"
      belongs_to :enterprise_cadastre_situation, class_name: "Candidate::EnterpriseCadastreSituation", foreign_key: "enterprise_cadastre_status_id"
    end
  end
end
