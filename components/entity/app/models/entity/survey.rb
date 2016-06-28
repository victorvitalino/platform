module Entity
  class Survey < ActiveRecord::Base
    scope :cnpj,  -> (cnpj) {where(cnpj: cnpj)}
  end
end
