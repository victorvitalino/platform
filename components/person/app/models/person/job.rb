module Person
  class Job < ActiveRecord::Base
    validates_presence_of :name

    audited
    
    has_many :staffs

  end
end
