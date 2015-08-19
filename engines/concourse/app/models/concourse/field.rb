module Concourse
  class Field < ActiveRecord::Base
    belongs_to :subscribe
    belongs_to :participation
  end
end
