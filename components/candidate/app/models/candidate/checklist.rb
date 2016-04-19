module Candidate
  class Checklist < ActiveRecord::Base
    belongs_to :checklist_type
  
    scope :by_type, -> (type) { where(checklist_type_id: type)}

    validates :name, :code, :checklist_type, presence: true
    validates_uniqueness_of :name, scope: :checklist_type
  end
end
