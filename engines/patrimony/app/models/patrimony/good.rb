module Patrimony
  class Good < ActiveRecord::Base
    belongs_to :sector, class_name: "Person::Sector"
    belongs_to :user, class_name: "Person::User"
    belongs_to :material
    belongs_to :property

    scope :property, -> (org) {where(property:org)}
  end
end
