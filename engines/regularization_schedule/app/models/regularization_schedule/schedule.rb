module RegularizationSchedule
  class Schedule < ActiveRecord::Base
    belongs_to :agenda

   enum :status => [:attendance_waiting, :attended]


  end
end
