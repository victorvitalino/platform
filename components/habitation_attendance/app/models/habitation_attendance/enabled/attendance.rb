module HabitationAttendance
  module Enabled
    class Attendance < Candidate::Attendance
    
      def initialize_attendance!(cpf, staff_id)
        cadastre = Cadastre.habitation.situation(4).find_by_cpf(cpf.unformat_cpf) rescue nil
        return false if cadastre.nil? || staff_id.nil?

        mirror = cadastre.cadastre_mirrors.new
        mirror.set_clone(cadastre.attributes)
        mirror.save
        mirror.set_clone_dependent(cadastre.dependents)
              
        self.cadastre_id = cadastre.id
        self.cadastre_mirror_id = mirror.id
        self.cadastre_mirror_id = mirror.id
        self.attendance_status_id = 7 # => parecer do gerente
        self.staff_id = staff_id
        self.save
      end

    end
  end
end
