module Protocol
  class ControlInterested < ActiveRecord::Base
    belongs_to :state, class_name: "Address::State"
    belongs_to :city, class_name: "Address::City"
    belongs_to :staff, class_name: "Person::Staff"
    belongs_to :control

    enum :interested_type => [:interested, :sender]

  end
end
