module Person
	class SystemPermissionPolicy < ApplicationPolicy

		def index?
			false
		end

	end
end