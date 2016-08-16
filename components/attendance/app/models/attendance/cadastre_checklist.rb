module Attendance
  class CadastreChecklist < ActiveRecord::Base

    def self.contains?(check)
      self.where(checklist_id: check.id).present? rescue false 
    end
  end
end
