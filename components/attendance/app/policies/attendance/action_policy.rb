module Attendance
  class ActionPolicy < ApplicationPolicy
    
    def cancel?
      true
    end

    def continue?
      true
    end

    def allow_action?
      true
    end

  end
end