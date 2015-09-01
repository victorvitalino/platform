module Candidate
  class CadastreProceduralStatus < ActiveRecord::Base
    belongs_to :adjunct_cadastre
    belongs_to :procedural_status
    belongs_to :convocation
    belongs_to :assessment
  end
end
