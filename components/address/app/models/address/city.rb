module Address
  class City < ActiveRecord::Base
    belongs_to :state

    has_many :agendas,  class_name: "RegularizationSchedule::Agenda"

    scope :federal_district, -> { joins(:state)
                                  .where('address_states.acronym = ?', 'DF')
                                  .order(:name) }
  end
end
