module Address
  class Unit < ActiveRecord::Base
    belongs_to :situation_unit
    belongs_to :city
    has_many :registry_units
    has_many :cadastre_address, class_name: "Candidate::CadastreAddress"

    scope :address, -> (address) {where("complete_address LIKE ?", "#{address}%")}
    scope :status, -> (status) {where(situation_unit_id: status)}

  end
end
