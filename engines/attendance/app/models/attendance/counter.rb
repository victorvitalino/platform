module Attendance
  class Counter < ActiveRecord::Base
    has_many :counter_subjects

    accepts_nested_attributes_for :counter_subjects, allow_destroy: true

    validates_presence_of :number
    validates :number, :uniqueness => {:scope => :station_id}
  end
end
