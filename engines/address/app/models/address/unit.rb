module Address
  class Unit < ActiveRecord::Base
    belongs_to :situation_unit
    belongs_to :city
    has_many :registry_units
    has_many :cadastre_address, class_name: "Candidate::CadastreAddress"
  end
end
