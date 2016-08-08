module Candidate
  class CadastreOcurrence < ActiveRecord::Base
    belongs_to :ocurrence_situation
  end
end
