module Concourse
  class CandidateField < ActiveRecord::Base
    belongs_to :project
  end
end
