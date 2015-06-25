module Concourse
  class SubscribeObservation < ActiveRecord::Base
    belongs_to :subscribe_candidate
  end
end
