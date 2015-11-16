module Attendance
  class Subject < ActiveRecord::Base
    has_many :counters

    default_scope {where(status: true)}

    validates_presence_of :name
  end
end
