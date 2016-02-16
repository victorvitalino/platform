module Entity
  class Situation < ActiveRecord::Base
    belongs_to :situation_status
  end
end
