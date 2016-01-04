module Candidate
  class Pontuation < ActiveRecord::Base
    belongs_to :cadastre_mirror

    def year
      Date.parse(self.code.to_s)
    end
  end
end
