module Address
  class City < ActiveRecord::Base
    belongs_to :state

    scope :federal_district, -> { joins(:state)
                                  .where('address_states.acronym = ?', 'DF')
                                  .order(:name) }
  end
end
