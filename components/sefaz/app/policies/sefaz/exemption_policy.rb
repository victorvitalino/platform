module Sefaz
	class ExemptionPolicy < ApplicationPolicy
		def view_nav?
      		  self.index? || self.seat?
    		end
		def index?
			allow?(12010)
		end
		def create?
			allow?(12007)
		end
		def update?
			allow?(12008)
		end
		def destroy?
			allow?(12009)
		end
	end
end
