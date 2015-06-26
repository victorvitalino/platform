module Cms
	class NavCategoryPolicy < ApplicationPolicy
		def index?
			allow?(3103)
		end

		def create?
			allow?(3101)
		end

		def update?
			allow?(3101)
		end

		def destroy?
			allow?(3102)
		end
	end
end
