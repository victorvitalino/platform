module Concourse
  class Participation < ActiveRecord::Base
    belongs_to :project
    belongs_to :subscribe
  end
end
