module Cms
	class PagePolicy < ApplicationPolicy
		def view_nav?
      		  self.index? || self.seat?
    		end

		def index?
			allow?(21016)
		end

		def create?
			allow?(21011)
		end

		def update?
			allow?(21012)
		end

		def destroy?
			allow?(21013)
		end

		def publish?
			allow? (21014)
		end

		def review?
			allow? (21015)
		end

	end
end
