module Candidate
  class Checklist < ActiveRecord::Base
    belongs_to :program

    scope :regularization, -> { where(program_id: 3)}
  end
end
