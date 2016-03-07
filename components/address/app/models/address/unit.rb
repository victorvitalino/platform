module Address
  class Unit < ActiveRecord::Base
    belongs_to :situation_unit
    belongs_to :city
    belongs_to :enterprises, class_name: "Firm::Enterprise", foreign_key: 'firm_enterprise_id'
    has_many :registry_units
    has_many :notary_offices
    has_many :cadastre_address, class_name: "Candidate::CadastreAddress"


    scope :address, -> (address) {where("complete_address LIKE ?", "#{address}%")}
    scope :status, -> (status) {where(situation_unit_id: status)}

    scope :city, -> (city) {where(city_id: city)}
    scope :block, -> (block) {where(block: block)}
    scope :group_address, -> (group_address) {where(group: group_address)}
    scope :unit, -> (unit) {where(unit: unit)}


    scope :situation_unit, -> (situation_unit) {where(situation_unit_id: situation_unit)}
    scope :cpf, -> (cpf) {joins(cadastre_address: :cadastre).where("candidate_cadastres.cpf = ?", cpf)}
    scope :name_candidate, -> (name_candidate) {joins(cadastre_address: :cadastre).where("candidate_cadastres.name ILIKE ?","#{name_candidate}%")}


  end
end
