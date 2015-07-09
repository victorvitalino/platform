module Protocol
  class Conduct < ActiveRecord::Base
    belongs_to :assessment
    belongs_to :sector_send
    belongs_to :user_send
    belongs_to :sector_receptor
    belongs_to :allotment
  end
end
