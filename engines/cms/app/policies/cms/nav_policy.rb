module Cms
	class NavPolicy < ApplicationPolicy
		def index?
			allow?(3203)
		end

		def create?
			allow?(3201)
		end

		def update?
			allow?(3201)
		end

		def destroy?
			allow?(3202)
		end
	end
end
