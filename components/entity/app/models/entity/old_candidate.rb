module Entity
  class OldCandidate < ActiveRecord::Base
    belongs_to :old
    belongs_to :cadastre
  end
end
