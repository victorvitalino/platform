module Person
	class SectorPolicy < ApplicationPolicy
		def index?
			allow?(1303)
		end

		def create?
			allow?(1301)
		end

		def update?
			allow?(1301)
		end

		def destroy?
			allow?(1302)
		end
	end
end