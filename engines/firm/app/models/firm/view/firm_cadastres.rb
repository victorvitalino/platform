module Firm
  module View
    class FirmCadastres < ActiveRecord::Base
      self.table_name = 'firm_cadastres'

      belongs_to :cadastre, class_name: "Candidate::Cadastre", foreign_key: "cadastre_id"
      belongs_to :status_cadastre, class_name: "Firm::StatusCadastre", foreign_key: "status_cadastre_id"
    end
  end
end