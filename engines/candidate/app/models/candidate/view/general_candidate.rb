module Candidate
  module View
    class GeneralCandidate < ActiveRecord::Base
      self.table_name = 'general_candidates'

      scope :by_income, -> (started_at = 0, ended_at = 1000) { where(income: started_at..ended_at) }
    end
  end
end