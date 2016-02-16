module Person
	class StaffPermissionPolicy < ApplicationPolicy

		def view_nav?
      		  self.index? || self.seat?
    		end

		def index?
			allow?(41305)
		end

		def enable?
			allow?(41305)
		end

		def disable?
			allow?(41305)
		end
	end
end
