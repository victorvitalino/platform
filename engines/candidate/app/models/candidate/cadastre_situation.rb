module Candidate
  class CadastreSituation < ActiveRecord::Base
    belongs_to :situation_status
  end
end
