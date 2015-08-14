module Attendance
  class Subject < ActiveRecord::Base
    has_many :counters

    validates_presence_of :name
  end
end
