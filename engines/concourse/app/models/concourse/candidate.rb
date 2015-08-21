module Concourse
  class Candidate < ActiveRecord::Base
    belongs_to :city
    belongs_to :state, class_name: "Address::State"
  end
end
