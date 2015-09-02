module Candidate
  class Kinship < ActiveRecord::Base

    has_many :kin_adjunct
  end
end
