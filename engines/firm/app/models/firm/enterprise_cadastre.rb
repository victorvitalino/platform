module Firm
  class EnterpriseCadastre < ActiveRecord::Base

    belongs_to :cadastre, class_name: "Candidate::Cadastre"
    belongs_to :status_cadastre
  end
end
