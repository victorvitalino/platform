module RegularizationTreatment
  class AttendancePolicy < ApplicationPolicy
    
    def attendant?
      user.account.attendant.present? && user.account.attendant.station.present?
    end
     
  end
end