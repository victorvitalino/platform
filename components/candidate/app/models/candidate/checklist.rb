module Candidate
  class Checklist < ActiveRecord::Base
    belongs_to :program

    scope :by_program, -> (program) {where(program_id: program)}
    
    validates :name, :code, :program, presence: true
    validates :name, :code, uniqueness: true
  end
end
