module Protocol
  class Location < ActiveRecord::Base
    belongs_to :assessment
    belongs_to :user
  end
end
