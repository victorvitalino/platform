module Address
  class NotaryOffice < ActiveRecord::Base
    belongs_to :unit
  end
end
