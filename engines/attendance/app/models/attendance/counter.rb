module Attendance
  class Counter < ActiveRecord::Base
    has_many :counter_subjects

    default_scope {where(status: true)}

    accepts_nested_attributes_for :counter_subjects, allow_destroy: true

    validates :number, :uniqueness => {:scope => :station_id}, allow_blank: true
  end
end
