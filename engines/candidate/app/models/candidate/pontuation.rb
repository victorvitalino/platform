module Candidate
  class Pontuation < ActiveRecord::Base
    belongs_to :cadastre_mirror
  end
end
