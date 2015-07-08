module Protocol
  class DigitalDocument < ActiveRecord::Base
    belongs_to :assessment
    belongs_to :user
  end
end
