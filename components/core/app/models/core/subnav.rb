module Core
  class Subnav < ActiveRecord::Base
    belongs_to :nav
    belongs_to :subnav, class_name: "Core::Subnav"
    belongs_to :staff, class_name: "Person::Staff"

    has_many :subnav_child, class_name: "Core::Subnav", foreign_key: "subnav_id"

  end
end
