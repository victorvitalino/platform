module Concourse
  class Candidate < ActiveRecord::Base
    belongs_to :project
    belongs_to :city
    belongs_to :state
  end
end
