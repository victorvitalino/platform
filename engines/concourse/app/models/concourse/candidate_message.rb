module Concourse
  class CandidateMessage < ActiveRecord::Base
    belongs_to :candidate
  end
end
