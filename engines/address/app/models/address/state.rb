module Address
  class State < ActiveRecord::Base
        has_many :agendas,  class_name: "RegularizationSchedule::Agenda"
  end
end
