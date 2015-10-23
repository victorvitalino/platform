module Attendance
  class CounterAttendant 
    include ActiveModel::Model
    
    attr_accessor :counter, :station, :attendant, :id

    validates_presence_of :station, :attendant

    validate :unique_attendant?, if: :set_counter

    private

    def unique_attendant?
      @station_attendant = StationAttendant.where(attendant_id: self.attendant, counter_id: self.counter, status: true)
      if @station_attendant.present?
        errors.add(:counter, 'já existe um atendente neste guichê') 
      end
    end

    def set_counter
      self.counter.present?
    end
  end
end