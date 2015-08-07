module Address
  class Unit < ActiveRecord::Base
    belongs_to :situation_unit
    belongs_to :city
    has_many :registry_units
  end
end
