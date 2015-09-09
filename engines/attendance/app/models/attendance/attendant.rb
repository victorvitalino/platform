module Attendance
  class Attendant < ActiveRecord::Base
    belongs_to :staff, -> { order(:name) }, class_name: "Person::Staff"
    
    default_scope {where(status: true)}

    has_one :station_attendant

    validates :staff, presence: true, uniqueness: true
    
    def staff_name
      "#{staff.name}".upcase
    end
  end
end
