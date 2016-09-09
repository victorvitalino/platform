module Person
  class BranchLineStaff < ActiveRecord::Base
    belongs_to :branch_line
    belongs_to :staff
  end
end
