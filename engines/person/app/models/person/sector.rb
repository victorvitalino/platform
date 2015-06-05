module Person
  class Sector < ActiveRecord::Base
    belongs_to :father
    belongs_to :responsible

    validates_presence_of :name, :code, :status

  end
end
