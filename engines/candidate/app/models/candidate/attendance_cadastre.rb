module Candidate
  class AttendanceCadastre < ActiveRecord::Base
    belongs_to :adjunct_cadastre
    belongs_to :attendance_status
    belongs_to :attendant, class_name: "Attendance::Attendant"
  end
end
