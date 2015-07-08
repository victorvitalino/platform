module Person
  class Job < ActiveRecord::Base
    validates_presence_of :name, :code

    has_many :staffs

  end
end
