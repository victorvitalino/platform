module RegularizationSchedule
  class Agenda < ActiveRecord::Base
    belongs_to :city , class_name: "Address::City"
    belongs_to :station , class_name: "Address::State"
    has_many :schedules

 def time_by_date(date)
    @hours = get_hours
    @date  = Date.parse(date)
    @hours.delete_if { |hour| Time.parse(hour) < Time.now + 2.hour}  if @date == Date.today

    agendas.where(date: @date).group(:hour).count(:id).each do |key, value|

      if self.lunch
        @hours.delete(key.strftime("%H:%M")) if value >= (self.lunch_attendants)
      else
        @hours.delete(key.strftime("%H:%M")) if value >= self.quantity_attendants
      end
    end

    @hours
  end

  private

  def get_hours

    @time   = self.time_attendant
    @start  = self.hour_start
    @end  = self.hour_end
    @hours  = []

    while @next_time != @end
      @next_time = @start if @next_time.nil?
      @hours << @next_time.strftime('%H:%M')
      @next_time = @next_time + @time.minutes
    end

    @hours
  end


  end
end
