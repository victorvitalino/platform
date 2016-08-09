module Candidate
  class CadastreOccurrence < ActiveRecord::Base
    belongs_to :occurrence_situation
  end
end
