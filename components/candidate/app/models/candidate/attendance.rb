module Candidate
  class Attendance < ActiveRecord::Base
    belongs_to :cadastre
    belongs_to :cadastre_mirror
    belongs_to :convocation
    belongs_to :attendance_status
    belongs_to :staff, class_name: 'Person::Staff'
    
    # => abstraction data

    def staff_code
      staff.present? ? staff.code : 'Sem informação'
    end

    def attendance_status_name
      attendance_status.present? ? attendance_status.name : 'Sem informação' 
    end


  end
end
