module Protocol
	class ConductPolicy < ApplicationPolicy
		def view_nav?
      		  self.index? || self.seat?
    		end
		def index?
			allow?(31101)
		end

		def add?
			allow?(31104)
		end

		def receive?
			allow?(31102)
		end

		def return?
			allow?(31105)
		end
	end
end
