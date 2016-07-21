module Entity
  class Old < ActiveRecord::Base

    has_many :old_candidates

    scope :name_entity,  -> (name_entity) {where("name ILIKE '%#{name_entity}%'")}
    scope :code,  -> (code) {where("fantasy_name ILIKE '%#{code}%'")}
    scope :cnpj,  -> (cnpj) {where(cnpj: cnpj)}
    scope :status,  -> (status) {where(old: status)}


  end
end
