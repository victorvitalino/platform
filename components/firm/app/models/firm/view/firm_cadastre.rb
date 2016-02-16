module Firm
  module View
    class FirmCadastre < ActiveRecord::Base
      self.table_name = 'firm_cadastres'

      scope :cpf, -> (cpf) {where(cpf: cpf)}
      scope :status, -> (status) {where(status_cadastre_id: status)}
      scope :name_candidate, -> (name_candidate) {where("name LIKE ? ", "#{name_candidate}%")}

      belongs_to :cadastre, class_name: "Candidate::Cadastre", foreign_key: "cadastre_id"
      belongs_to :status_cadastre, class_name: "Firm::StatusCadastre", foreign_key: "status_cadastre_id"
    end
  end
end