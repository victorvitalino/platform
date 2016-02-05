module Cms
	class PostPolicy < ApplicationPolicy
		def view_nav?
      		  self.index? || self.seat?
    		end

		def index?
			allow?(21006)
		end

		def create?
			allow?(21001)
		end

		def update?
			allow?(21002)
		end

		def destroy?
			allow?(21003)
		end

		def publish?
			allow? (21004)
		end

		def review?
			allow? (21005)
		end
	end
end
