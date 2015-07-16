module Protocol
  class Subject < ActiveRecord::Base
    has_many :assessment
  end
end
