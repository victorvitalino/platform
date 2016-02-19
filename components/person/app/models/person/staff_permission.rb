module Person
  class StaffPermission < ActiveRecord::Base
    belongs_to :system
    belongs_to :system_permission
    belongs_to :system_module
    belongs_to :staff

    validates_uniqueness_of :staff, :scope => :system_permission
  end
end
