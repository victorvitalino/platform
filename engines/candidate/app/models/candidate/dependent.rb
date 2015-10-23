module Candidate
  class Dependent < ActiveRecord::Base
    belongs_to :cadastre
    belongs_to :civil_state
    belongs_to :kinship
    belongs_to :special_condition
  end
end
