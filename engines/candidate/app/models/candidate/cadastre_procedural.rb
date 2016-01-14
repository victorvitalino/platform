module Candidate
  class CadastreProcedural < ActiveRecord::Base
    belongs_to :procedural_status
    belongs_to :convocation
  end
end
