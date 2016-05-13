module Protocol
  class ControlRoute < ActiveRecord::Base
    belongs_to :route_sector, class_name: "Person::Sector"
    belongs_to :route_staff, class_name: "Person::Staff"
    belongs_to :control



  end
end
