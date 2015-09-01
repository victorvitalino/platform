module Candidate
  class ChecklistTreatment < ActiveRecord::Base
    belongs_to :checklist
    belongs_to :cadastre_treatment
  end
end
