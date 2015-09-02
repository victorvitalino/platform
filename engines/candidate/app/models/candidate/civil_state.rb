module Candidate
  class CivilState < ActiveRecord::Base

    has_many :kin_adjunct
  end
end
