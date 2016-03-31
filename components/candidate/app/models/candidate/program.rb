module Candidate
  class Program < ActiveRecord::Base
    has_many :positions
  end
end
