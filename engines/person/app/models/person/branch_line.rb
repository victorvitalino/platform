module Person
  class BranchLine < ActiveRecord::Base
    validates_presence_of :telephone, :description
    validates :telephone, :description, uniqueness: true

    audited
    
    belongs_to :sector
    has_many :staffs

  end
end
