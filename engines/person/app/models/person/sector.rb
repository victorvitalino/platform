module Person
  class Sector < ActiveRecord::Base
    belongs_to :father
    belongs_to :responsible
  end
end
