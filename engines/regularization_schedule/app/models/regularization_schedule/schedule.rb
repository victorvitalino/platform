module RegularizationSchedule
  class Schedule < ActiveRecord::Base

    belongs_to :agenda
    belongs_to :requiriment

   enum :status => [:attendance_waiting, :attended]

   validates_presence_of :agenda, :cpf,:date_schedule,:hour_schedule

   validates :cpf, cpf: true



  end
end
