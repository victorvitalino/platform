module RegularizationSchedule
  class Schedule < ActiveRecord::Base
    belongs_to :agenda

   enum :status => [:attendance_waiting, :attended]

   validates_presence_of :agenda, :cpf,:date_schedule,:hour_schedule

   validates :cpf, cpf: true

  end
end
