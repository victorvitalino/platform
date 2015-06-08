module Person
  class Job < ActiveRecord::Base
    validates_presence_of :name, :code
  end
end
