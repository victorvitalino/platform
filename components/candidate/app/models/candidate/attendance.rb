module Candidate
  class Attendance < ActiveRecord::Base
    belongs_to :cadastre
    belongs_to :cadastre_mirror
    belongs_to :convocation
    belongs_to :attendance_status
  end
end
