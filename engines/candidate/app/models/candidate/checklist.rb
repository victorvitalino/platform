module Candidate
  class Checklist < ActiveRecord::Base
    belongs_to :checklist_type

    scope :habitation,            -> { where(checklist_type_id: 1, status: true)}
    scope :informal_installment,  -> { where(checklist_type_id: 2, status: true)}
    scope :consolidated_city,     -> { where(checklist_type_id: 3, status: true)}

  end
end
