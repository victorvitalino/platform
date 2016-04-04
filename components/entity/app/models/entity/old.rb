module Entity
  class Old < ActiveRecord::Base

    has_many :old_candidates

    scope :name_entity,  -> (name_entity) {where(name: name_entity)}
    scope :code,  -> (code) {where(fantasy_name: code)}
    scope :cnpj,  -> (cnpj) {where(cnpj: cnpj)}
  end
end
