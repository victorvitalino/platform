module Candidate
  class Cadin < ActiveRecord::Base
    belongs_to :occurrence_cadin
    belongs_to :signed_instrument
    belongs_to :city
  end
end
