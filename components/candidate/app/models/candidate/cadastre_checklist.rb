module Candidate
  class CadastreChecklist < ActiveRecord::Base
    belongs_to :cadastre_mirror
    belongs_to :checklist
  end
end
