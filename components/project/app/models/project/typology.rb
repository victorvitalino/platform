module Project
  class Typology < ActiveRecord::Base
    has_many :enterprise

    validates :name, :home_type, :private_area, :income_family, :initial_value, :end_value, presence: true

    def complete_name
      "#{self.id} - #{self.name}"
    end
  end
end
