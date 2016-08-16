module Attendance
  class Checklist < ActiveRecord::Base

    scope :habitation, -> { where(program_id: [1,2])}
    scope :regularization, -> { where(program_id: 3)}
  end
end
