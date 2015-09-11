module Attendance
  class StationAttendant < ActiveRecord::Base
    belongs_to :attendant
    belongs_to :counter
    belongs_to :station

    scope :active, -> {where(status: true)}

    validates :attendant, presence: true, uniqueness: true
  end
end
