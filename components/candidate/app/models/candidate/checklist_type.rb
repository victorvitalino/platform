module Candidate
  class ChecklistType < ActiveRecord::Base
    belongs_to :program

    has_many :checklists
    
    scope :by_program, -> (program) { where(program_id: program)}

    validates :name, :program, presence: true
    validates :name, uniqueness: true
  end
end
