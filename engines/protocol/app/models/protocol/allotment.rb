module Protocol
  class Allotment < ActiveRecord::Base
    belongs_to :user
  end
end
