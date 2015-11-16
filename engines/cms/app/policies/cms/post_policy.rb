module Cms
	class PostPolicy < ApplicationPolicy
		def index?
			allow?(3503)
		end

		def create?
			allow?(3501)
		end

		def update?
			allow?(3501)
		end

		def destroy?
			allow?(3502)
		end

		def publish?
			allow? (3505)
		end
	end
end
