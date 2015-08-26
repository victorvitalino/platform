module RegularizationSchedule
  class Agenda < ActiveRecord::Base
    belongs_to :city , class_name: "Address::City"
    belongs_to :station , class_name: "Address::State"
    has_many :schedules

   default_scope { where(publish: true) }

  def time_by_date(date)
    @hours = get_hours
    @date  = Date.parse(date)
    @hours.delete_if { |hour| Time.parse(hour) < Time.now + 2.hour}  if @date == Date.today

    RegularizationSchedule::Schedule.where(date_schedule: @date).group(:hour_schedule).count(:id).each do |key, value|


     end
    @hours
   end


  private

  def get_hours

    @time   = self.time_attendant
    @start  = self.hour_start
    @end  = self.hour_end
    @hours  = []
    @start_lunch = self.lunch_start
    @end_lunch = self.lunch_end

    if !self.lunch
      @start_lunch = self.hour_end
    end

    while @next_time != @start_lunch
     @next_time = @start if @next_time.nil?
     @hours << @next_time.strftime('%H:%M')
     @next_time = @next_time + @time.minutes
    end

    if self.lunch
      while @next_time1 != @end
       @next_time1 = @end_lunch if @next_time1.nil?
       @hours << @next_time1.strftime('%H:%M')
       @next_time1 = @next_time1 + @time.minutes
      end
    end

    #while @next_time != @end
      #@next_time = @start if @next_time.nil?
      #@hours << @next_time.strftime('%H:%M')
      #@next_time = @next_time + @time.minutes
    #end
    #if self.lunch
      #@hours.delete(self.lunch_start.strftime('%H:%M')) if self.lunch_start.present?
      #@hours.delete(self.lunch_end.strftime('%H:%M')) if self.lunch_end.present?
    #end

    @hours
  end


  end
end
