module Cms
	class NavPolicy < ApplicationPolicy
		def index?
			allow?(21031)
		end

		def new?
			allow?(21031)
		end

		def edit?
			allow?(21031)
		end

		def destroy?
			allow?(21031)
		end
	end
end
