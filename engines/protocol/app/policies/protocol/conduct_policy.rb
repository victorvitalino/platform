module Protocol
	class ConductPolicy < ApplicationPolicy
		def index?
			allow?(4303)
		end
		def create?
			allow?(4301)
		end
		def update?
			allow?(4301)
		end
		def destroy?
			allow?(4302)
		end

		def add?
			allow?(4306)
		end

		def receive?
			allow?(4305)
		end

		def return?
			allow?(4304)
		end
	end
end
