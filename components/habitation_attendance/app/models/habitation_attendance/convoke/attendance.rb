module HabitationAttendance
  module Convoke
    class Attendance < Candidate::CadastreAttendance
    
      def initialize_attendance!(cpf, staff_id)
        cadastre = Candidate::Cadastre.habitation.situation(3).find_by_cpf(cpf.unformat_cpf) rescue nil
        return false if cadastre.nil? || staff_id.nil?

        mirror = cadastre.cadastre_mirrors.new
        mirror.set_clone(cadastre.attributes)
        mirror.save
        mirror.set_clone_dependent(cadastre.dependents)
        
        attendance = Candidate::CadastreAttendance.new
        attendance.cadastre_id        = cadastre.id
        attendance.cadastre_mirror_id = mirror.id
        attendance.staff_id           = staff_id
        attendance.attendance_type    = 1
        attendance.situation          = 0
        attendance.save

        status = attendance.cadastre_attendance_statuses.new

        status.attendance_status_id = 4
        status.staff_id             = staff_id
        status.mirror_id            = mirror.id
        status.save
      end

    end
  end
end
