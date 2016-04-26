module Candidate
  class CadastreAttendance < ActiveRecord::Base

    belongs_to :staff, class_name: "Person::Staff"
    belongs_to :attendance_status
    belongs_to :cadastre
    belongs_to :cadastre_mirror

    def self.initialize_attendance!(cadastre, staff_id)
      return false if cadastre.nil? || staff_id.nil?
      return false if cadastre.cadastre_attendances.where(id: 4).present?

      mirror = cadastre.cadastre_mirrors.new
      mirror.set_clone(cadastre.attributes)
      mirror.save
      mirror.set_clone_dependent(cadastre.dependents)
            
      attendance = self.new
      attendance.cadastre_id = cadastre.id
      attendance.cadastre_mirror_id = mirror.id
      attendance.cadastre_mirror_id = mirror.id
      attendance.attendance_status_id = 4
      attendance.staff_id = staff_id

      attendance.save
    end

    def supervisor?
      self.attendance_status == 5
    end

    private
    
    def create_mirror(attributes = {})
      attributes.each do |key, value|
        unless %w(id created_at updated_at).include? key
          self[key] = value if self.attributes.has_key?(key)
        end
      end
    end

  end
end

