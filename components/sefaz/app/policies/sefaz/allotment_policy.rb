module Sefaz
	class AllotmentPolicy < ApplicationPolicy
		def view_nav?
      		  self.index? || self.seat?
    		end
		def index?
			allow?(12001)
		end
		def create?
			allow?(12002)
		end
		def update?
			allow?(12003)
		end
		def destroy?
			allow?(12004)
		end
    def send_allotment?
			allow?(12005)
		end
    def to_process?
			allow?(12006)
		end
	end
end
