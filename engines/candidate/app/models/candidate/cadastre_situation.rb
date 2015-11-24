module Candidate
  class CadastreSituation < ActiveRecord::Base
    has_many :situation_statuses
  end
end
