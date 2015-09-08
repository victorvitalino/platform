module Attendance
  class StationAttendant < ActiveRecord::Base
    belongs_to :attendant
    belongs_to :counter
    belongs_to :station

    validates_presence_of :attendant, :counter
  end
end
