module Candidate
  class Position < ActiveRecord::Base
    belongs_to :cadastre
    belongs_to :pontuation
    belongs_to :program
  end
end
