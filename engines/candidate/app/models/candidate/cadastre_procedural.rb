module Candidate
  class CadastreProcedural < ActiveRecord::Base
    belongs_to :procedural_status
    belongs_to :convocation
    belongs_to :cadastre
  end
end
