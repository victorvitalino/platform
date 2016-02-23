module Schedule
  class Agenda < ActiveRecord::Base
    has_many :agenda_schedules
    belongs_to :program, class_name: "Candidate::Program"

    enum restriction_type: ['nenhuma', 'existente', 'inexistente']

    scope :regularization,  -> { where(program: 3)}
    scope :habitation,      -> { where(program: 1)}
    scope :active,          -> { where(status: true)}
    
    validates :program, :description, presence: true
    validates :attendants, :attendance_time, numericality: true, presence: true
    validates :title, presence: true, uniqueness: true
    validates :lunch_attendants, numericality: true, presence: true, if: :lunch?

    validates_date :start, before: :end, presence: true
    validates_date :end, presence: true

    validates_time :start_hour, presence: true
    validates_time :end_hour, presence: true

    validates_time :lunch_start, before: :lunch_end, presence: true, if: :lunch?
    validates_time :lunch_end, presence: true, if: :lunch?


    def hours(date)
      hour_array      = Array.new
      lunch_array     = Array.new

      start_hour  = self.start_hour
      last_hour   = self.end_hour  - attendance_time.minutes

      if lunch?
        lunch_start = self.lunch_start
        lunch_end   = self.lunch_end - attendance_time.minutes
  
        time_iterate(lunch_start, lunch_end, attendance_time.minutes)  { |t| lunch_array.push t.strftime('%H:%M') }
      end
      
      time_iterate(start_hour, last_hour, attendance_time.minutes)      { |t| hour_array.push t.strftime('%H:%M') } 

      attendance_iterate(hour_array, lunch_array, self.attendants, self.lunch_attendants, date)
    end


    private

    def attendance_iterate(hour = [], lunch = [], attendant = 0, lunch_attendant = 0, date)
      Array.new(hour.count) do |i|
        if lunch.include? hour[i]
          (schedules_time(hour[i], date) >= lunch_attendant) ? 'esgotado' : hour[i]
        else
          (schedules_time(hour[i], date) >= attendant) ? 'esgotado' : hour[i]
        end
      end
    end

    def time_iterate(start_time, end_time, step, &block)
      begin
        yield(start_time)
      end while (start_time += step) <= end_time
    end


    def schedules_time(time,date)
      agenda_schedules.where(hour: time, date: date, status: 0).count
    end

    def lunch?
      self.lunch_time?
    end
  end
end
