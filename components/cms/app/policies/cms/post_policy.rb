module Cms
	class PostPolicy < ApplicationPolicy
		
		def index?
			allow?(21004)
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


	end
end
