module Candidate
  class KinAdjunct < ActiveRecord::Base

    belongs_to :civil_state
    belongs_to :kinship

  

    validates_presence_of :income

  end
end
