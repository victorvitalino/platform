module Protocol
  class Location < ActiveRecord::Base
    belongs_to :assessment
    belongs_to :staff, class_name: "Person::Staff"
  end
end
