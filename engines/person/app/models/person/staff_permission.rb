module Person
  class StaffPermission < ActiveRecord::Base
    belongs_to :staff
    belongs_to :system_permission



  end
end
