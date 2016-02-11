module Candidate
  class CadastreActivity < ActiveRecord::Base
    belongs_to :cadastre
    belongs_to :staff
  end
end
