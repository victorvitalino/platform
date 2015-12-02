module Candidate
  class Checklist < ActiveRecord::Base
    belongs_to :program
  end
end
