module RegularizationTreatment
  class Attendant < ActiveRecord::Base
    belongs_to :staff, class_name: "Person::Staff"
    belongs_to :service_station

    enum privilege: [:attendant,:supervisor]

    validates_presence_of :staff, :service_station, :privilege
  end
end
