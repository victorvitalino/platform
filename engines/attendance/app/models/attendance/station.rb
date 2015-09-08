module Attendance
  class Station < ActiveRecord::Base
    belongs_to :city, class_name: "Address::City"
    belongs_to :convocation, class_name: "Candidate::Convocation"

    has_many :attendants, class_name: "StationAttendant"
    has_many :counters

    enum station_type: ['cidade consolidada', 'parcelamento formal', 'N/D']

    validates_presence_of :name, :city, :station_type
  end
end
