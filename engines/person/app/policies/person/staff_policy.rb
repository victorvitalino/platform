module Person
	class StaffPolicy < ApplicationPolicy

		def index?
			allow?(1603)
		end

		def create?
			allow?(1601)
		end

		def update?
			allow?(1601)
		end

		def destroy?
			allow?(1602)
		end
	end
end
