module Cms
	class VideoPolicy < ApplicationPolicy
		def index?
			allow?(3703)
		end

		def create?
			allow?(3701)
		end

		def update?
			allow?(3701)
		end

		def destroy?
			allow?(3702)
		end

		def publish?
			allow? (3705)
		end
	end
end
