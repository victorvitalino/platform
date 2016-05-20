module Protocol
  class ControlRoute < ActiveRecord::Base
    belongs_to :route_sector, -> {where status: true}, class_name: "Person::Sector"
    belongs_to :route_staff, -> {where(status: true).order(:name)}, class_name: "Person::Staff"
    belongs_to :control



  end
end
