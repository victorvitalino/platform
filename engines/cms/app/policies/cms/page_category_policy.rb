module Cms
	class PageCategoryPolicy < ApplicationPolicy
		def index?
			allow?(3303)
		end

		def create?
			allow?(3301)
		end

		def update?
			allow?(3301)
		end

		def destroy?
			allow?(3302)
		end
	end
end
