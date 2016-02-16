module Candidate
  class CadastreSituation < ActiveRecord::Base
    belongs_to :situation_status
    belongs_to :cadastre
  end
end
