module Visit
  class Lifting < ActiveRecord::Base

    scope :by_localization, -> (value) { where("localization ILIKE '%#{value}%'") }
    scope :by_cpf,          -> (value) { where(cpf: value) }
    scope :by_name,         -> (value) { where("name ILIKE '%#{value}%'") }
  end
end
