module Candidate
  class CadastreChecklist < ActiveRecord::Base
    belongs_to :cadastre
    belongs_to :attendance

    has_many :checklist
  end
end
