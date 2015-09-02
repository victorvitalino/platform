module Candidate
  class AttendanceCadastre < ActiveRecord::Base
       belongs_to :adjunct_cadastre
       belongs_to :attendance_status
  end
end
