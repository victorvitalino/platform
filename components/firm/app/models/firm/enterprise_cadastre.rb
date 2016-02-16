module Firm
  class EnterpriseCadastre < ActiveRecord::Base

    belongs_to :cadastre, class_name: "Candidate::Cadastre"
    belongs_to :status_cadastre
    belongs_to :enterprise

    scope :cpf,  -> (cpf) {joins(:cadastre).where('candidate_cadastres.cpf = ?', cpf)}
    scope :name_candidate,  -> (name) {joins(:cadastre).where('candidate_cadastres.name like ?', "#{name}%")}
    scope :status, -> (status) { where(status: status) }

  end
end
