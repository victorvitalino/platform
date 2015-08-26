module Attendance
  class Attendant < ActiveRecord::Base
    belongs_to :staff, -> { order(:name) }, class_name: "Person::Staff"
    
    validates :staff, presence: true, uniqueness: true
  end
end
