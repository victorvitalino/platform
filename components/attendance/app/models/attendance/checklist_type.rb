module Attendance
  class ChecklistType < ActiveRecord::Base
    has_many :checklists
  end
end
