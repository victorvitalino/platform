module Cms
	class PostCategoryPolicy < ApplicationPolicy
		def index?
			allow?(3603)
		end

		def create?
			allow?(3601)
		end

		def update?
			allow?(3601)
		end

		def destroy?
			allow?(3602)
		end
	end
end
