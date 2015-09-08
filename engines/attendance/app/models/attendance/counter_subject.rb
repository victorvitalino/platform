module Attendance
  class CounterSubject < ActiveRecord::Base
    belongs_to :counter
    belongs_to :subject

    validates_presence_of :subject
    validates :subject, :uniqueness => {:scope => :counter_id}
   end
end
