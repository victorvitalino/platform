module Address
  class Unit < ActiveRecord::Base
    belongs_to :situation_unit
    belongs_to :type_use_unit
    belongs_to :city
  end
end
