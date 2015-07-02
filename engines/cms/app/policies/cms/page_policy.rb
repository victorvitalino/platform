module Cms
	class PagePolicy < ApplicationPolicy
		def index?
			allow?(3403)
		end

		def create?
			allow?(3401)
		end

		def update?
			allow?(3401)
		end

		def destroy?
			allow?(3402)
		end
	end
end
